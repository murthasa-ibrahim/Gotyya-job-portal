import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/sign_up_model.dart';
import 'package:project_gotyaa/models/signup_response_model.dart';
import 'package:project_gotyaa/view/registration/sign_in/sign_in.dart';
import 'package:project_gotyaa/utils/util.dart';

import '../data/remote/services/sign_up.dart';

class SignUpProvider extends ChangeNotifier {
  bool hidePassword = false;
  bool isLoad = false;

  // api errors
  String? emailError;
  String? userNmaeError;

  // controllers
  final globalKey = GlobalKey<FormState>();
  final TextEditingController namController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

    void  clearTextFeild(){
         mailController.clear();
      namController.clear();
      passwordController.clear();
      conformPasswordController.clear();
      }

  // signUp request
  postRequest(BuildContext context) async {
    notifyListeners();

    if (globalKey.currentState!.validate()) {
      final email = mailController.text;
      final userName = namController.text;
      final password = passwordController.text;
      
      final user = SignUpModel(
        email: email,
        username: userName,
        password: password,
      );
      isLoad = true;
      SignUpResponsModel? response =
          await SignUpRegistration().createUser(user);

      if (response != null) {
        isLoad = false;
        notifyListeners();
        
        if (response.email != null) {
        await  Utility.displaySnackbar(
              context: context,
              msg:'Successfully registerd',
              color: Colors.green);
              clearTextFeild();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),);

          // log('log6');
          // showDialog(
          //     context: context,
          //     builder: (innerContext) {
          //       return AlertDialog(
          //         content: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             const Text(
          //               'Successfully registered',
          //               style: TextStyle(
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.green),
          //             ),
          //             const SizedBox(
          //               height: 10,
          //             ),
          //             Text(
          //               'We have sent a varification link to ${response.email} check and validate',
          //               style: const TextStyle(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.black),
          //             ),
          //           ],
          //         ),
          //         actions: [
          //           TextButton(
          //             onPressed: () {
          //               
          //               Navigator.of(context).pop();
          //               
                        
          //             },
          //             child: const Text(
          //               'OK',
          //               style: TextStyle(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.black),
          //             ),
          //           )
          //         ],
          //       );
          //     });
        } else {
          log('log7');
          Utility.displaySnackbar(
              context: context,
              msg: response.message ?? 'something went wrong',
              color: Colors.red);
        }
      } else {
        isLoad = false;
        notifyListeners();
        log('log8');
        Utility.displaySnackbar(
            context: context, msg: 'No Network Found!', color: Colors.red);
      }

    }
  }

  // clear email error
  clearEmailError() {
    if (emailError != null) {
      emailError = null;
      notifyListeners();
    }
  }
  // clear email userName error

  clearUsernamError() {
    if (userNmaeError != null) {
      userNmaeError = null;
      notifyListeners();
    }
  }

  // change obscure text value
  void changePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}
