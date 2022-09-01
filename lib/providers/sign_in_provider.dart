import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_gotyaa/models/sign_in_model.dart';
import 'package:project_gotyaa/screens/home.dart';
import 'package:project_gotyaa/screens/navbar.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';
import 'package:project_gotyaa/services/sgin_in_service.dart';
import 'package:project_gotyaa/utility/util.dart';

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
      const clientId = ApiEndpoints.clientId;
      const clientSecret = ApiEndpoints.clientSecret;
      const grantType = "password";

      final data = SignInModel(
          clientId: clientId,
          clientSecret: clientSecret,
          grantType: grantType,
          username: email,
          password: password);
      isLoad = true;
      notifyListeners();
      SignInService().signInRquest(data, context).then((response) {
        isLoad = false;
        notifyListeners();
        if (response == 'success') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Navbar(),
          ));
        } else {
          Utility.displaySnackbar(
              context: context, msg: response, color: Colors.red);
        }
      });
    }
  }
}
