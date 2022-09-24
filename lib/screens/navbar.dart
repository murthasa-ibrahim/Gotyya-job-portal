import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:project_gotyaa/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavBarProvider>(
          builder: (_, value, child) => (value.screens[value.screenIndex])),
      bottomNavigationBar: Consumer<NavBarProvider>(
        builder: (context, value, child) => BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded), label: 'blog'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: Badge(
                  showBadge: value.alertCheck,
                  padding: const EdgeInsets.all(0),
                  position: BadgePosition.topEnd(),
                  badgeContent: const Icon(
                    Icons.error_outline_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.person,
                  ),
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
