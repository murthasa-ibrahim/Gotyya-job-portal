
import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/sign_in_model.dart';
import 'package:project_gotyaa/view/navbar/navbar.dart';
import 'package:project_gotyaa/utils/util.dart';

import '../data/remote/services/sgin_in_service.dart';

class SignInProvider extends ChangeNotifier {
  // bool values
  bool isLoad = false;
  bool hidePassword = true;
  void changePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //validation

  checkValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      final data = SignInModel(email: email, password: password);
      isLoad = true;
      notifyListeners();
      SignInService().signInRquest(data, context).then((response) {
        isLoad = false;
        notifyListeners();
        if (response.accessToken != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Navbar(),
          ));
        } else if (response.message != null) {
          Utility.displaySnackbar(context: context, msg: response.message!,color: Colors.red);
        } else {
          Utility.displaySnackbar(
              context: context, msg: "No internet!", color: Colors.red);
        }
      });
    }
  }
}
