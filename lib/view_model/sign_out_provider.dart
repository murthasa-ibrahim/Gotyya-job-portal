import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/registration/sign_in/sign_in.dart';
import 'package:project_gotyaa/utils/util.dart';

class SignOutProvider extends ChangeNotifier {
  bool isLoad = false;
  signOut(BuildContext context) async {
    isLoad = true;
    notifyListeners();
    await Utility.storage.delete(key: 'access').whenComplete(
      () {
        isLoad = false;
        notifyListeners();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        );
      },
    );
  }
}
