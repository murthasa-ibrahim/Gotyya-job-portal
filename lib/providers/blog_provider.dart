

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/services/create_blog_api.dart';
import 'package:project_gotyaa/utility/util.dart';

class BlogProvider extends ChangeNotifier{

  final headlineController = TextEditingController();
  final contentController = TextEditingController();
    void createBlog(BuildContext context)async{
      
      final obj = BlogPostModel(title: headlineController.text, content: contentController.text);
    final response = await  BlogService().createBlogApi(obj);
    if(response != null){
        if(response.content != null){
          log(response.content.toString());
          Utility.displaySnackbar(context: context, msg: "Blog added Successfully",color: Colors.green);
         
        }
        else{
             Utility.displaySnackbar(context: context, msg: response.message??'something went wrong!!',color: Colors.red);
        }
    }
    else{
      Utility.displaySnackbar(context: context, msg: 'No Network Found!',color: Colors.red);
    }
      
    }
}