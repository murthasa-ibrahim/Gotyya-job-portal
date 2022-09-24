import 'package:flutter/cupertino.dart';

import '../screens/blog.dart';
import '../screens/chat_list.dart';
import '../screens/home.dart';
import '../screens/profile.dart';



class NavBarProvider extends ChangeNotifier{
   
    int screenIndex = 0;
    List<Widget> screens = [
    const Home(),
    const Screen2(),
    const ChatList(),
    const ProfileScreen(),
  ];
  changeIndex(int index){
      screenIndex = index;
      notifyListeners();
    }

    bool alertCheck = true;
    
}