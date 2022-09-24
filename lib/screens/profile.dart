
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/providers/create_profile_provder.dart';
import 'dart:math' as math;
import 'package:project_gotyaa/screens/settings.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          MyProfile(height: math.max(w / 3, h * .3)),
          ProfileCard(
            width: w,
            title: 'About me',
          ),
          const SizedBox(height: 15),
          ProfileCard(width: w, title: 'My skills'),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.teal),
            margin: EdgeInsets.only(left: w * .05, right: w * .05),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact',
                      style: GoogleFonts.spectral(
                          fontSize: 23, fontWeight: FontWeight.bold)),
                  const Text(
                    "Email  : sail@gmail.com \nPhone : 9061118778",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  
                ],
              ),
              
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.width, required this.title})
      : super(
          key: key,
        );

  final double width;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: width * .05, right: width * .05),
        // height: h,
        // width: w,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.spectral(fontSize: 26, color: Colors.black),
              ),
              Text(
                "c the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                style: GoogleFonts.spectral(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  
  
  @override
  Widget build(BuildContext context) {
    double circleHeight = widget.height * 2 / 3;
   final profilProvider = context.read<CreateProfileProvder>();
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.height,
          child: Stack(
            children: [
              Container(
                height: circleHeight,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.teal, Colors.green])),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Profile',
                          style: GoogleFonts.spectral(
                              fontSize: 40, fontWeight: FontWeight.bold)))),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(circleHeight / 2),
                  child: Consumer<CreateProfileProvder>(
                    builder: (context, value, child) => 
                     Container(
                        height: circleHeight,
                        width: circleHeight,
                        color: Colors.black,
                        child: profilProvider.imageFile == null
                            ? Image.asset(
                                'asset/images/avathar.jpg',
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                profilProvider.imageFile!,
                                fit: BoxFit.cover,
                              )),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: circleHeight / 2),
                    child: ElevatedButton(
                        onPressed: () {
                         profilProvider.pickSource(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 30,
                          ),
                        )),
                  )),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Settings(),));
                        //showSettings();
                      },
                      icon: const Icon(
                        Icons.settings,
                        size: 25,
                      )))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('Harry Styles',
            style: GoogleFonts.spectral(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal)),
        Text('UI/UX designer', style: GoogleFonts.spectral(fontSize: 27)),
      ],
    );
  }



  // showSettings() {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (context) {
  //         final size = MediaQuery.of(context).size;
  //         return Container(
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //             color: Colors.white,
  //           ),
  //           height: math.max(size.width / 3, size.height * .3),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               InkWell(
  //                   onTap: () {
  //                     Navigator.pop(context);
  //                     Navigator.of(context).push(MaterialPageRoute(
  //                       builder: (context) => const EditProfile(),
  //                     ));
  //                     // chosePIck(ImageSource.camera);
  //                   },
  //                   child: Text('Edit profile',
  //                       style: GoogleFonts.spectral(
  //                           fontSize: 25, fontWeight: FontWeight.bold))),
  //               const Divider(
  //                 thickness: 1,
  //                 color: Colors.teal,
  //               ),
  //               InkWell(
  //                   onTap: () {},
  //                   child: const Text(
  //                     'Saved Jobs',
  //                     style:
  //                         TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //                   )),
  //               const Divider(
  //                 thickness: 1,
  //                 color: Colors.teal,
  //               ),
  //               InkWell(
  //                   onTap: () => Navigator.pop(context),
  //                   child: const Text(
  //                     'Saved Jobs',
  //                     style:
  //                         TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //                   ))
  //             ],
  //           ),
  //         );
  //       });
  // }
}
