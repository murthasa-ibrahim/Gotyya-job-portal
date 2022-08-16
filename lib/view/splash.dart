
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/navbar.dart';

class Splash extends StatelessWidget {
const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Navbar(),
            )));
    return  Scaffold(
      body: Container(    
        decoration:const BoxDecoration( image: DecorationImage(image: AssetImage('asset/images/gotyaa.jpg'),fit: BoxFit.cover)) ,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(.7),
          child:  Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const  [
                Text(
                  'Gotyaa',
                  style: TextStyle(
                      color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
                ),
                  Text(
              'Find Your Job',
              style: TextStyle(
                  color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
