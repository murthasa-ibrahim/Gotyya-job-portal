import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_gotyaa/providers/navbar_provider.dart';
import 'package:project_gotyaa/providers/sign_in_provider.dart';
import 'package:project_gotyaa/providers/sign_up_provider.dart';
import 'package:project_gotyaa/screens/home.dart';
import 'package:project_gotyaa/screens/navbar.dart';
import 'package:project_gotyaa/screens/sign_in.dart';
import 'package:project_gotyaa/screens/splash.dart';
import 'package:provider/provider.dart';
String? jwt = '';
Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   const storage = FlutterSecureStorage();
    jwt = await storage.read(key: 'jwt');

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
        ChangeNotifierProvider<SignUpProvider>(create: (context) => SignUpProvider(),),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        // textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.teal,
        ),
        initialRoute: jwt== null ? 'login':'home',
        routes: {
          'home' :(context)=> const Splash(),
          'login':(context) => const SignIn(), 
        },
      ),
      
    );
  }
}
