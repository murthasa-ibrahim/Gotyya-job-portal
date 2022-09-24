import 'package:flutter/material.dart';
import 'package:project_gotyaa/screens/sign_in.dart';
import 'package:project_gotyaa/utility/util.dart';



class SignOutProvider extends ChangeNotifier {
  signOut(BuildContext context) async {
    
   await Utility.storage.delete(key: 'access');
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),));
 
  }
}
