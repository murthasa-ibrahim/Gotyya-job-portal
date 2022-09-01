
import 'package:flutter/material.dart';

class Utility {
  static  displaySnackbar({required BuildContext context, required String msg,Color? color}){
      final snackBar = SnackBar(content: Text(msg),backgroundColor: color,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}