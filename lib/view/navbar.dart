import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/home.dart';
import 'package:project_gotyaa/view/screen_2.dart';
import 'package:project_gotyaa/view/screen_3.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int screenIndex = 0;

  List<Widget> screens = [const Home(), const Screen2(), const Screen3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: screens[screenIndex],
      bottomNavigationBar: 
      Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: .2),color: Colors.white,),
        height: 60,
        child: Theme(
          data: Theme.of(context).copyWith (
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent ), 
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            IconButton(
              enableFeedback: false,
              onPressed: (){
                setState(() {
                  screenIndex = 0;
                });
              }, icon: 
                screenIndex == 0
               ? const Icon(Icons.work,color: Color.fromARGB(255, 82, 225, 182),
                  size: 25,)
               : const Icon(Icons.work_outline,color: Colors.black,
                  size: 25,),   
                  ),
              IconButton(
              enableFeedback: false,
              onPressed: (){
                 setState(() {
                  screenIndex = 1;
                });
              },  icon: screenIndex == 1
               ? const Icon(Icons.chat_bubble,color: Color.fromARGB(255, 82, 225, 182),
                  size: 25,)
               : const Icon(Icons.chat_bubble_outline,color: Colors.black,
                  size: 25,),   
                  ),
              IconButton(
              enableFeedback: false,
              onPressed: (){
                 setState(() {
                  screenIndex = 2;
                });
              },  icon: screenIndex == 2
               ? const Icon(Icons.manage_accounts_rounded,color: Color.fromARGB(255, 82, 225, 182),
                  size: 25,)
               : const Icon(Icons.manage_accounts_outlined,color: Colors.black,
                  size: 25,),   
                  ),
          ],),
        ),
      )
    );
  }
}
