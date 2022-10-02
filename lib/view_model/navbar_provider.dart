import 'package:flutter/cupertino.dart';

import '../view/blog.dart';
import '../view/chat_list.dart';
import '../view/home.dart';
import '../view/profile.dart';



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