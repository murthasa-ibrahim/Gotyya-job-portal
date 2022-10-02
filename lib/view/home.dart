import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/add_new_job.dart';
import 'package:project_gotyaa/view/cteate_profile.dart';
import 'package:project_gotyaa/view/jobs_from_catogories.dart';
import 'package:project_gotyaa/view_model/get_profile_provider.dart';
import 'package:provider/provider.dart';

import '../view/new_user_peofile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * .25,
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(Icons.sentiment_satisfied_outlined)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gotyaa',
                        style: GoogleFonts.spectral(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              context.read<GetProfileProvider>().noProfile
                                  ? const CreateProfile(name: "Create your Profile",)
                                  : const UserProfile(),
                        )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'asset/images/proman.jpg',
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50, child: CupertinoSearchTextField()),
                  Text(
                    'Categories',
                    style: GoogleFonts.spectral(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * .23,
              width: w,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const JobsList(),
                  )),
                  child: Container(
                    height: 60,
                    width: w * .7,
                    margin: EdgeInsets.all(w * .03),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        
                        gradient: const LinearGradient(
                            colors: [Colors.deepOrange, Colors.orange])),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Web Designing',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spectral(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
              child: Text(
                'Jobs For You',
                style: GoogleFonts.spectral(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded
            (
              child: SizedBox(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    width: w * 1,
                   
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                          gradient: const LinearGradient(
                              colors: [Colors.grey, Colors.black]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Web designing',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.spectral(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                              Text(
                                'Mobile app autimation engineers with work experience 3 -5 years skills',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.spectral(
                                   
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.cyan),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                child: Text(
                                  "Apply Now",
                                  style: GoogleFonts.spectral(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.amber,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  AddJob(),));
            },
              backgroundColor: const Color.fromARGB(255, 19, 96, 104),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: 'Add Jobs',
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
          SpeedDialChild(
              backgroundColor: const Color.fromARGB(255, 97, 22, 114),
              child: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: 'Saved Jobs',
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
