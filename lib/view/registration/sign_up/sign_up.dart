import 'package:flutter/material.dart';
import 'package:project_gotyaa/view_model/sign_up_provider.dart';
import 'package:project_gotyaa/view/registration/sign_in/sign_in.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';
import 'package:provider/provider.dart';

import '../sign_in/sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/jobnew.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black.withOpacity(.4),
                  height: h,
                  width: w,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: h * .7,
                    child: Form(
                      key: signUpProvider.globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              onChanged: (value) {
                                signUpProvider.clearUsernamError();
                              },
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.name,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: 'user Name',
                                  errorText: context
                                      .watch<SignUpProvider>()
                                      .userNmaeError),
                              controller: signUpProvider.namController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'name is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              onChanged: (value) {
                                signUpProvider.clearEmailError();
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'email',
                                errorText:
                                    context.watch<SignUpProvider>().emailError,
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                              ),
                              controller: signUpProvider.mailController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('@')) {
                                  return 'enter a valid mail';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<SignUpProvider>(
                              builder: (_, value, child) => MyTextFeild(
                                controller: signUpProvider.passwordController,
                                textInputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        value.changePasswordVisibility();
                                      },
                                      icon: Icon(value.hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  prefixIcon: const Icon(
                                    Icons.lock_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                                obscureText: value.hidePassword,
                                validator: (value) {
                                  if (value == null || value.length < 8) {
                                    return 'Password should be atleast 8 charectors';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<SignUpProvider>(
                              builder: (context, value, child) => MyTextFeild(
                                textInputAction: TextInputAction.done,
                                inputType: TextInputType.number,
                                obscureText: value.hidePassword,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Conform password',
                                  prefixIcon: Icon(
                                    Icons.lock_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                                controller:
                                    signUpProvider.conformPasswordController,
                                validator: (value) {
                                  if (signUpProvider
                                          .conformPasswordController.text !=
                                      signUpProvider.passwordController.text) {
                                    return 'there is a miss match between passwords';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: w,
                                height: w * .15,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green)),
                                    onPressed: () {
                                      signUpProvider.postRequest(context);
                                    },
                                    child: signUpProvider.isLoad
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.red,
                                            ),
                                          )
                                        : const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ))),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              const Text(
                                " Have an account already?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                )),
                                child: const Text(
                                  " Sign in",
                                  style: TextStyle(
                                      color: Colors.teal, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
