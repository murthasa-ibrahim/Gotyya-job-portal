

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:project_gotyaa/data/remote/services/add_like.dart';

class AddLikeProvider extends ChangeNotifier{
  bool isLike = false;
  //  likeStatus()=> isLike = !isLike;
  void addLike(BuildContext context,int id) async{
    
      final response = await AddLike().addLikeApi(context,id);
      if(response ==  'success'){
          isLike = !isLike;
          log( "success");
          notifyListeners();
      }
  }
}