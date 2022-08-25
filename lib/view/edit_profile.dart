
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: ListView(
        children: [
           
         Row(
           children: [
            IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 30,)),
              Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text( 'Edit Profile',style: GoogleFonts.spectral(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
             ),
           ],
         ),
          Container(
            margin: EdgeInsets.only(
              left: size.width * .04,
              right: size.width * .04,
            ),
            // height: size.height * 1,
            //  color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
              children: [
                MyTextFeild(
                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 20,),
                  TextFormField(
                      decoration: InputDecoration(
                         fillColor: Colors.white,
                         filled: true,
                          hintText: 'Head line',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                const SizedBox(
                  height: 20,
                ),
                 Text( 'About me',style: GoogleFonts.spectral(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                TextFormField(
                  minLines: 9,
                  maxLines: 9,
                  decoration: InputDecoration(
                     fillColor: Colors.white,
                      filled: true,
                   hintStyle:const  TextStyle(color: Colors.black),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 20,
                ),
                  Text( 'My skills',style: GoogleFonts.spectral(fontSize: 20,color: Colors.white),),
                 TextFormField(
                  minLines: 9,
                  maxLines: 9,
                  decoration: InputDecoration(
                     fillColor: Colors.white,
                      filled: true,
                   hintStyle:const  TextStyle(color: Colors.teal),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 20,),
                  Text( 'Experience',style: GoogleFonts.spectral(fontSize: 20,color: Colors.white),),
                 TextFormField(
                  minLines: 2,
                  maxLines: 2,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                      filled: true,
                   hintStyle:const  TextStyle(color: Colors.teal),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 20,),
                  Text( 'Contact',style: GoogleFonts.spectral(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                   TextFormField(
                     maxLines: 1,
                     decoration: InputDecoration(
                       fillColor: Colors.white,
                       filled: true,
                         hintText: ' phone',
                         hintStyle: const TextStyle(color: Colors.black),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8))),
                   ),
                   const SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                          hintText: 'email',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      )),
    );
  }
}
