

import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/navbar.dart';
import 'package:project_gotyaa/view/sign_up.dart';

class SignIn extends StatelessWidget {
   SignIn({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
     final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
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
                Row(
                  children:const [
                     SizedBox(width: 25,),
                     Text(
                      'Sign In',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                     Spacer()
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  // color: Colors.amber,
                  height: h * 0.6,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'enter your email';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'email',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'enter password';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'password',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SignUp(),));},
                              child: const Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            if(_formKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing data')));
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Navbar(),));
                            }
                           
                          },
                          child: Container(
                            height: w * .15,
                            width: w * .87,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('OR',style: TextStyle(fontSize: 18,color: Colors.white),),
                        const Text('Sign in With',style: TextStyle(fontSize: 18,color: Colors.white),),
                        const SizedBox(height: 10,),
                        Image.asset('asset/images/google (1).png',height: 40,width: 40,),
                      ],
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
