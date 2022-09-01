import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/screens/chat_page.dart';
import 'package:project_gotyaa/screens/widget/my_container.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key}) : super(key: key);

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
                      'Android Engineer',
                      style: GoogleFonts.spectral(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    MyContainer(
                      height: 20,
                      width: 40,
                      color: Colors.amber,
                      radius: 3,
                      child: Center(child: Text('Full')),
                    ),
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
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
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
          child: MyContainer(
            height: 30,
            width: 50,
            radius: 10,
            color: Colors.teal,
            child: Center(
              child: Text(
                'Start Chatting',
                style: GoogleFonts.spectral(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
