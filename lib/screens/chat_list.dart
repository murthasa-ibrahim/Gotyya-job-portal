
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/screens/chat_page.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: 
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text( 'Chats',style: GoogleFonts.spectral(fontSize: 40,fontWeight: FontWeight.bold),),
          
          const Divider(thickness: 1,),
          Expanded(
            child: ListView.separated(
             itemBuilder: (context, index) => 
               ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatScreen(),)),
              leading: 
                ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.asset(
                  'asset/images/man.jpg',
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                )
              ),
              title:   Text( 'Ivan Hazard',style: GoogleFonts.spectral(fontSize: 20,fontWeight: FontWeight.bold),),
              trailing: Text( '12 pm',style: GoogleFonts.spectral(fontWeight: FontWeight.bold),),
             ),
             separatorBuilder: (context,index){
              return const Divider(color: Colors.white,);
             },
              itemCount: 3,
            ),
          )
        ],
       ),
     )),
    );
  }
}