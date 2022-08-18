import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/custom_widgets/my_container.dart';
import 'package:project_gotyaa/view/custom_widgets/my_text.dart';

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
                  children: const [
                    MyText(
                      data: 'Android Engineer',
                      size: 25,
                      fontWeight: FontWeight.bold,
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
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 30,
                    ),
                    MyText(
                      data: 'Ivan hazard',
                      size: 20,
                    ),
                    MyText(data: 'details')
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
                        children: const [
                          MyText(
                            data: 'Job Description',
                            size: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                          Spacer()
                        ],
                      ),
                      const MyText(
                          data:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",size: 20,),
                              SizedBox(height: h*.04,),
                    //  MyContainer(height: h*.065, width: w*.8, child: const Center(child: MyText(data:'Start Chatting',size: 30,),),radius:10 ,color: Colors.teal,)
                    ],
                  ),
                )
                      ],
                    ),
              ),
            ],
          )),
      bottomNavigationBar: Container(margin: EdgeInsets.all(20), height: 50,width: 70,child:   MyContainer(height: 30, width: 50, child: const Center(child: MyText(data:'Start Chatting',size: 30,),),radius:10 ,color: Colors.teal,),),
    );
  }
}
