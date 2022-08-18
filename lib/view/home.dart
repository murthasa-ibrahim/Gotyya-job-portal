
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/job_details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(child: 
      Column(children: [
        
        Row(children: [
          SizedBox(width: w*.04,),
          Text('Jobs for you',style: GoogleFonts.alice(fontSize: 30,fontWeight: FontWeight.bold),),
          const Spacer(),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,size: 25,))  
        ],),
        SizedBox(height: h*.01,),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JobDetails(),)),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Text('Android Engineer',style: GoogleFonts.balooTamma2(fontSize: 23),),
                        const Spacer(),
                        Text('2 - 4 LPA',style: TextStyle(color:Colors.teal[400]),)
                      ],),
                      Row(children: [
                         Container(color: Colors.teal,height: 30,width: 40,),
                         const SizedBox(width: 20,),
                         const Text('Ivan hazard',style: TextStyle(fontSize: 16),)
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           const Text('3 - 5 years'),
                          const ColoredBox(color: Colors.blueGrey,child: Padding(
                            padding:  EdgeInsets.all(4.0),
                            child: Text('flutter',style: TextStyle(color: Colors.white),),
                          ),),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.star_outline))
                        ],
                      )
                  ],),
                ),
              ),
            ),
            itemCount: 20,
          ),
        )
      ],)
     ),
    );
  }
}