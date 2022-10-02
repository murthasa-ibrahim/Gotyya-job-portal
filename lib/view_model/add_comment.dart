import 'package:flutter/cupertino.dart';
import 'package:project_gotyaa/data/remote/services/add_comment.dart';

class AddCommentProvider extends ChangeNotifier{
  void addComment(){
    AddComment().addCommentApi();
  }
}