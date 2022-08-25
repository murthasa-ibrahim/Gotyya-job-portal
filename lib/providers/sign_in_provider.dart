
import 'package:flutter/material.dart';

import '../view/navbar.dart';

class SignInProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //validation

  checkValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Navbar(),
      ));
    }
  }
}
