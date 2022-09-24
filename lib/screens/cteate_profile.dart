import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/screens/widget/text_form_field.dart';
import 'package:provider/provider.dart';

import '../providers/create_profile_provder.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profileProvider = context.read<CreateProfileProvder>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    'Complete your Profile',
                    style: GoogleFonts.spectral(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Consumer<CreateProfileProvder>(
              builder: (context, value, child) => ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: value.imageFile == null
                    ? Image.asset('asset/images/avathar.jpg',
                        fit: BoxFit.cover,
                        height: size.width * .4,
                        width: size.width * .4)
                    : Image.file(value.imageFile!,
                        fit: BoxFit.cover,
                        height: size.width * .4,
                        width: size.width * .4),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CreateProfileProvder>().pickSource(context);
                  },
                  child: const Text(
                    'Add photto',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )),
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
                    controller: profileProvider.nameController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Name',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  // const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                       controller: profileProvider.headlineController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Head line',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    'About me',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextFormField(
                     controller: profileProvider.aboutController,
                    minLines: 9,
                    maxLines: 9,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const AddEducation(),
                      // ));
                      context
                          .read<CreateProfileProvder>()
                          .createProfileRequest(context);
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}






















































// import 'package:flutter/material.dart';
// import 'package:project_gotyaa/providers/create_profile_provder.dart';
// import 'package:provider/provider.dart';

// class CreateProfile extends StatelessWidget {
//   const CreateProfile({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     //  final profileProvider = Provider.of<CreateProfileProvder>(context,listen: false);
//     return Scaffold(
//       body: SafeArea(
//         child:Container(
//           margin: EdgeInsets.all(15),
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.teal
//           ),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               // const SizedBox(height: 25,),
//                const Text('Create Your Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//               //  const SizedBox(height: 20,),
//                 Consumer<CreateProfileProvder>(
//                   builder: (context, value, child) => 
//                    ClipRRect(
//                     borderRadius: BorderRadius.circular(300),
//                     child: value.imageFile == null
//                         ? Image.asset(
//                             'asset/images/avathar.jpg',
//                             fit: BoxFit.cover,
//                             height: size.width*.4,
//                             width: size.width*.4                                                                    
//                           )
//                         : Image.file(
//                             value.imageFile!,
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 ), 
//                          
//             ],
//           ),
//         ) 
//       ),
//     );
//   }
// }