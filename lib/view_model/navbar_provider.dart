import 'package:flutter/cupertino.dart';

import '../view/blog/blog_view/blog.dart';
import '../view/chat/chat_list/chat_list.dart';
import '../view/Home/home_view/home.dart';
import '../view/profile/profile/profile.dart';



class NavBarProvider extends ChangeNotifier{
   
    int screenIndex = 0;
    List<Widget> screens = [
    const Home(),
    const Blog(),
    const ChatList(),
    const ProfileScreen(),
  ];
  changeIndex(int index){
      screenIndex = index;
      notifyListeners();
    }

    bool alertCheck = true;
    
}