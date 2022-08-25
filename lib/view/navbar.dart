

import 'package:flutter/material.dart';
import 'package:project_gotyaa/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);
 
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // int screenIndex = 0;
  // List<Widget> screens = [
  //   const Home(),
  //   const Screen2(),
  //   const ChatList(),
  //   const ProfileScreen()
  // ];
  @override
  Widget build(BuildContext context) {
    // final navbarProvider = Provider.of<NavBarProvider>(context,listen: false);
    return Scaffold(
      body: Consumer<NavBarProvider>(
        builder: (_, value, child) => 
       (value.screens[value.screenIndex ])),
      bottomNavigationBar: Consumer<NavBarProvider>(
        builder: (context, value, child) => 
             BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded), label: 'blog'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'profile'),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          currentIndex: value.screenIndex,
          onTap: (index) {
         
            value.changeIndex(index);
           
          },
        ),
      ),
    );
  }
}
