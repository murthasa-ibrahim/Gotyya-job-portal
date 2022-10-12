import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/chat/chat_page/chat_page.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_sharp)),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.report_problem_outlined)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star_border_outlined)),
            ],
          ),
          SizedBox(
            height: h * .002,
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.spectral(
                          textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    // Container(
                    //   height: 20,
                    //   width: 40,
                    //   decoration: BoxDecoration(
                    //       color: Colors.amber,
                    //       borderRadius: BorderRadius.circular(3)),
                    //   child: const Center(child: Text('Full')),
                    // ),
                  ],
                ),
                SizedBox(
                  width: w,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 30,
                    ),
                    Text('Ivan hazard',
                        style: GoogleFonts.spectral(fontSize: 20)),
                    const Text('details'),
                  ],
                ),
                SizedBox(
                  width: w,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Container(
                  margin: EdgeInsets.only(left: w * .04, right: w * .04),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Job Description',
                            style: GoogleFonts.spectral(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 24),
                          ),
                          const Spacer()
                        ],
                      ),
                      Text(description,
                          style: GoogleFonts.spectral(fontSize: 20)),
                      SizedBox(
                        height: h * .04,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        )),
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 50,
          width: 70,
          child: Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Start Chatting',
                style: GoogleFonts.spectral(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
