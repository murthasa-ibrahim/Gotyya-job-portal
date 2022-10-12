import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../view_model/create_profile_provder.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profileProvider = context.read<CreateProfileProvder>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 25,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Add Education',
                    style: GoogleFonts.spectral(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Qualification',
              style: GoogleFonts.spectral(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(
              margin: EdgeInsets.only(
                left: size.width * .04,
                right: size.width * .04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyTextFeild(
                    maxLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Ex: Degree/plus two',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Department',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  MyTextFeild(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Ex: B.com',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Remark',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  MyTextFeild(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'shortly',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Starting date',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  MyTextFeild(
                    onTap: () => profileProvider.datePicker(
                        context, profileProvider.startDatecontroller),
                    controller: profileProvider.startDatecontroller,
                    readOnly: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Select Date',
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ending date',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  MyTextFeild(
                    controller: profileProvider.endDateController,
                    readOnly: true,
                    onTap: () => profileProvider.datePicker(
                        context, profileProvider.endDateController),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Select Date',
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                  //   Text( 'My skills',style: GoogleFonts.spectral(fontSize: 20,color: Colors.white),),
                  //  TextFormField(
                  //   minLines: 9,
                  //   maxLines: 9,
                  //   decoration: InputDecoration(
                  //      fillColor: Colors.white,
                  //       filled: true,
                  //    hintStyle:const  TextStyle(color: Colors.teal),
                  //    border: OutlineInputBorder(
                  //    borderRadius: BorderRadius.circular(8))),
                  // ),
                  // const SizedBox(height: 20,),
                  //   Text( 'Experience',style: GoogleFonts.spectral(fontSize: 20,color: Colors.white),),
                  //  TextFormField(
                  //   minLines: 2,
                  //   maxLines: 2,
                  //   decoration: InputDecoration(
                  //     fillColor: Colors.white,
                  //       filled: true,
                  //    hintStyle:const  TextStyle(color: Colors.teal),
                  //    border: OutlineInputBorder(
                  //    borderRadius: BorderRadius.circular(8))),
                  // ),
                  // const SizedBox(height: 20,),
                  //   Text( 'Contact',style: GoogleFonts.spectral(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  //    TextFormField(
                  //      maxLines: 1,
                  //      decoration: InputDecoration(
                  //        fillColor: Colors.white,
                  //        filled: true,
                  //          hintText: ' phone',
                  //          hintStyle: const TextStyle(color: Colors.black),
                  //          border: OutlineInputBorder(
                  //              borderRadius: BorderRadius.circular(8))),
                  //    ),
                  //    const SizedBox(height: 20,),
                  //     TextFormField(
                  //       decoration: InputDecoration(
                  //         fillColor: Colors.white,
                  //         filled: true,
                  //           hintText: 'email',
                  //           hintStyle: const TextStyle(color: Colors.black),
                  //           border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8))),
                  //     ),
                  // const SizedBox(height: 20,),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
