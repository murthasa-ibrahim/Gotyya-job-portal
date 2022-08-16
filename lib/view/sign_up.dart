import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/sign_in.dart';

class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
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
                        children: [
                          SizedBox(
                            height: h * .08,
                          ),
                          const Text(
                            'Create',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          const Text(
                            'An Account',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'name is requierd';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'full name',
                                  hintStyle: const TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator:  (value) {
                                if(value == null || value.isEmpty){
                                  return 'mail is requierd';
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator:  (value) {
                                if(value == null || value.isEmpty){
                                  return 'password is requierd';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'conform password is requierd';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'conform password',
                                  hintStyle: const TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>  SignIn(),
                                  ));
                                },
                                child: const Text(
                                  " Have an account already?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
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
                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('data is processing')));
                              }
                            },
                            child: Container(
                              height: w * .15,
                              width: w * .84,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
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
