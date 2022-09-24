
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/screens/add_new_job.dart';

import 'package:project_gotyaa/screens/job_details.dart';
import 'package:provider/provider.dart';

import '../providers/blog_get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscrollNotification) {
        overscrollNotification.disallowIndicator();
        return true;
      },
      child: Scaffold(
        // backgroundColor: Colors.blueGrey,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscrollNotification) {
              overscrollNotification.disallowIndicator();
              return true;
            },
            child: Column(
              children: [
                SizedBox(
                  height: h * .01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w * .06,
                    ),
                    Text(
                      'Jobs for you',
                      style: GoogleFonts.alice(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        
                        // context.read<BlogGetProvider>().getListBlog(context);

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const Search()));
                      },
                      icon: const Icon(Icons.search, size: 35),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddJob(),
                          ));
                        },
                        icon: const Icon(Icons.add_circle_rounded, size: 35)),
                    SizedBox(
                      width: w * .06,
                    ),
                  ],
                ),
                SizedBox(
                  height: h * .01,
                ),
                SizedBox(
                  width: w,
                  height: 10,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const JobDetails(),
                      )),
                      child: Container(
                        margin: EdgeInsets.all(w * .03),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: const LinearGradient(
                            //     begin: Alignment.topLeft,
                            //     colors: [Colors.teal, Colors.green])
                            color: const Color.fromARGB(255, 18, 91, 84)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text('Android Engineer',
                                      style: GoogleFonts.spectral(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 23)),
                                  const Spacer(),
                                  Text(
                                    'Bangalore',
                                    style: GoogleFonts.spectral(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              
                              Text(
                                'Mobile app autimation engineers with work experience 3 -5 years skills set required "- strong in java programing Strong understand ',
                                style: GoogleFonts.spectral(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.amber,
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Full Time',
                                          style: GoogleFonts.spectral(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.star_outline,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: 20,
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
