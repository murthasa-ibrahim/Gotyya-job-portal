import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/home.dart';
import 'package:project_gotyaa/view/screen_2.dart';
import 'package:project_gotyaa/view/profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int screenIndex = 0;

  List<Widget> screens = [const Home(), const Screen2(),  ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add_rounded), label: 'blog'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'profile'),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.teal,
        currentIndex: screenIndex,
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
      ),
    );
  }
}
