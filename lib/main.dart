import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/intro_page.dart';
import 'package:project_gotyaa/view/sign_in.dart';
import 'package:project_gotyaa/view/sign_up.dart';
import 'package:project_gotyaa/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      // textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.grey,
      ),
      home: const Splash()
    );
  }
}
