import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/providers/sign_in_provider.dart';


import 'package:project_gotyaa/view/sign_up.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
 const  SignIn({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final signInProvider = Provider.of<SignInProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/new.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Consumer<SignInProvider>(
                    builder: (__, value, _) => 
                     Form(
                      key:signInProvider.formKey ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              controller:signInProvider.emailController ,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'email',
                              ),
                              inputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter mail';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              controller:signInProvider.passwordController ,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password',
                              ),
                              obscureText: true,
                              inputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              validator:(value) {
                                if (value == null || value.isEmpty) {
                                  return 'password is required';
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
                            child: SizedBox(
                                width: w,
                                height: w * .15,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green)),
                                    onPressed: () {
                                     signInProvider.checkValidation(context);
                                    },
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ))),
                          ),
                          const Text(
                            'OR',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: w,
                                height: w * .15,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                            child: Image.asset(
                                          'asset/images/google (1).png',
                                          width: 50,
                                          height: 50,
                                        )),
                                        const Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ))),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    " Don't have an account?",
                                    style: GoogleFonts.spectral(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SignUp(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Create",
                                      style: GoogleFonts.spectral(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
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
