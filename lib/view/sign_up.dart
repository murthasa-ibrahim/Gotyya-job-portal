import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/user_model.dart';
import 'package:project_gotyaa/view/navbar.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController namController;
  // final TextEditingController mailController;
  // final TextEditingController passwordController;
  // final TextEditingController conformPasswordController;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/new.jpg'), fit: BoxFit.cover),
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
                      key: _formKey,
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
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.name,
                               decoration: InputDecoration(border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Name',
                            ),
                              // controller: namController,
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
                               decoration: InputDecoration(border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'email',
                            ),
                              // controller: mailController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mail is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              // controller:passwordController ,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                               decoration: const InputDecoration(border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            ),
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              textInputAction: TextInputAction.done,
                              inputType: TextInputType.number,  
                               decoration: const InputDecoration(border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Conform password',
                            ),
                              // controller: conformPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('data is processing')));
                              }
                            },
                            child: Padding(
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
                                        // if (_formKey.currentState!.validate()) {
                                        //   Navigator.of(context)
                                        //       .push(MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const Navbar(),
                                        //   ));
                                        // }
                                        // GetRequest();
                                        // httpRequest();
                                        // original();
                                        // SignUpRequest();
                                        LoginRequest();
                                      },
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))),
                            ),
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
                                onPressed: () => Navigator.of(context).pop(),
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
