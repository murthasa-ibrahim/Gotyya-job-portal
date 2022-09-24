import 'package:flutter/material.dart';
import 'package:project_gotyaa/providers/blog_get.dart';
import 'package:project_gotyaa/providers/blog_provider.dart';
import 'package:project_gotyaa/providers/create_profile_provder.dart';
import 'package:project_gotyaa/providers/navbar_provider.dart';
import 'package:project_gotyaa/providers/sign_in_provider.dart';
import 'package:project_gotyaa/providers/sign_out_provider.dart';
import 'package:project_gotyaa/providers/sign_up_provider.dart';
import 'package:project_gotyaa/screens/splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarProvider>(
          create: (context) => NavBarProvider(),
        ),
        ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider<SignOutProvider>(
          create: (context) => SignOutProvider(),
        ),
        ChangeNotifierProvider<CreateProfileProvder>(
          create: (context) => CreateProfileProvder(),
        ),
         ChangeNotifierProvider<BlogProvider>(
          create: (context) => BlogProvider(),
        ),
         ChangeNotifierProvider<BlogGetProvider>(
          create: (context) => BlogGetProvider(),
        ),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.teal,
        ),
        home:const  Splash(),
      ),
    );
  }
}
