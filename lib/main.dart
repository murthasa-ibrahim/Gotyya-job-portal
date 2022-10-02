import 'package:flutter/material.dart';
import 'package:project_gotyaa/view_model/add_comment.dart';
import 'package:project_gotyaa/view_model/blog_get.dart';
import 'package:project_gotyaa/view_model/blog_provider.dart';
import 'package:project_gotyaa/view_model/create_profile_provder.dart';
import 'package:project_gotyaa/view_model/get_category.dart';
import 'package:project_gotyaa/view_model/get_job_list.dart';
import 'package:project_gotyaa/view_model/get_profile_provider.dart';
import 'package:project_gotyaa/view_model/job_create.dart';
import 'package:project_gotyaa/view_model/navbar_provider.dart';
import 'package:project_gotyaa/view_model/sign_in_provider.dart';
import 'package:project_gotyaa/view_model/sign_out_provider.dart';
import 'package:project_gotyaa/view_model/sign_up_provider.dart';
import 'package:project_gotyaa/view/splash.dart';
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
        ChangeNotifierProvider<GetProfileProvider>(
          create: (context) => GetProfileProvider(),
        ),
         ChangeNotifierProvider<JobCreateProvider>(
          create: (context) => JobCreateProvider(),
        ),
          ChangeNotifierProvider<AddCommentProvider>(
          create: (context) => AddCommentProvider(),
        ),
         ChangeNotifierProvider<GetCategryProvider>(
          create: (context) => GetCategryProvider(),
        ),
            ChangeNotifierProvider<GetJobListProvider>(
          create: (context) => GetJobListProvider(),
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
