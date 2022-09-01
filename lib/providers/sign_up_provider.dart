
import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/sign_up_model.dart';
import 'package:project_gotyaa/screens/sign_in.dart';
import 'package:project_gotyaa/services/sign_up.dart';
import 'package:project_gotyaa/utility/util.dart';

class SignUpProvider extends ChangeNotifier {


  bool isLoad = false;

  // api errors
  String? emailError;
  String? userNmaeError;

  // controllers
  final formKey = GlobalKey<FormState>();
  final TextEditingController namController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  // signUp request
  postRequest(BuildContext context) {
    
    notifyListeners();
    
    if (formKey.currentState!.validate()) {
      final email = mailController.text;
      final userName = namController.text;
      final password = passwordController.text;

      final user = SignUpModel(
        email: email,
        username: userName,
        password: password,
      );
           isLoad = true;
      SignUpRegistration().createUser(user, context).then(
        (response) {
           isLoad = false;
          // checking user is null or not
          if (response == null) {
            return ;
          }

          // show snackbar if user register is success
          else if (response['success'] == true) {
            Utility.displaySnackbar(
                context: context,
                msg: response['message'],
                color: Colors.green);
                Navigator.of(context).pop();
          }

          // show validation error based on email and user name already exist or not
          if (response.containsKey('email')) {
            emailError = response['email'][0];
          }
          if (response.containsKey('username')) {
            userNmaeError = response['username'][0];
          }

          notifyListeners();
        },
      );
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
 void changePasswordVisibility(){
    hidePassword = !hidePassword;
    notifyListeners();
   }

   bool hidePassword = false;


  

}
