
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Utility {

     // snackbar
  static  displaySnackbar({required BuildContext context, required String msg,Color? color}){
      final snackBar = SnackBar(content: Text(msg),backgroundColor: color,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // jwt
 static String? jwt;

 // scuer storage 

 static const storage = FlutterSecureStorage();

}