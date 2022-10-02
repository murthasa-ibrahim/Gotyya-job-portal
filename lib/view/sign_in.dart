import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view_model/sign_in_provider.dart';


import 'package:project_gotyaa/view/sign_up.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const  SignIn({Key? key}) : super(key: key);
  // final emailController = TextEditingController();
  //  final passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final signInProvider = Provider.of<SignInProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            
            height: h,
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/jobnew.jpg'), fit: BoxFit.cover),
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
                              controller:value.emailController ,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person,color:Colors.black,),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'email',
                              ),
                              inputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty||!value.contains('@')) {
                                  return 'enter valid mail';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextFeild(
                              controller:value.passwordController ,
                              decoration:  InputDecoration(
                                border: const OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password',
                                prefixIcon: const Icon(Icons.lock_rounded,color:Colors.black,),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                      value.changePasswordVisibility();
                                  },
                                   icon: Icon(value.hidePassword ? Icons.visibility_off : Icons.visibility)
                                   )
                              ),
                              obscureText: value.hidePassword,
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
                                    // SignInService().signInMethod(email: emailController.text, password: passwordController.text);

                                    },
                                    child: signInProvider.isLoad ? const Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow),)
                                    : const Text(
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
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => const SignUp(),

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
