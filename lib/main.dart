import 'package:flutter/material.dart';
import 'package:project_gotyaa/providers/navbar_provider.dart';
import 'package:project_gotyaa/providers/sign_in_provider.dart';
import 'package:project_gotyaa/view/navbar.dart';
import 'package:project_gotyaa/view/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarProvider>(create: (context) => NavBarProvider(),),
        ChangeNotifierProvider<SignInProvider>(create: (context) => SignInProvider(),),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        // textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.teal,
        ),
        home:  const Splash()
      ),
    );
  }
}
