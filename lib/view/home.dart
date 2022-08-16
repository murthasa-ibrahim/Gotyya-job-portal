

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(children: [
          
          Row(children: [
            
            Text('Jobs for you',style: GoogleFonts.alice(fontSize: 30,fontWeight: FontWeight.bold),),
            const Spacer(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search,size: 25,))  
          ],),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    
                    // color: Color.fromARGB(255, 255, 214, 91),
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
                             const Text('Inof Technopark',style: TextStyle(fontSize: 16),)
                          ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const[
                               Text('3 - 5 years'),
                              ColoredBox(color: Colors.blueGrey,child: Padding(
                                padding:  EdgeInsets.all(4.0),
                                child: Text('flutter',style: TextStyle(color: Colors.white),),
                              ),),
                            ],
                          )
                      ],),
                    ),
                  ),
                ),
              ),
              itemCount: 20,
            ),
          )
        ],),
      )
     ),
    );
  }
}