import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_gotyaa/data/remote/services/delete_blog.dart';
import 'package:project_gotyaa/utils/util.dart';

class DeleteBlogProvider extends ChangeNotifier {
  void deleteBlog(BuildContext context, int id) async {
    final response = await DeleteBlog().deleteBlogApi(id);
    if (response == 'success') {
      log("success");
      Utility.displaySnackbar(context: context, msg: "Blog Deleted Successfully",color: Colors.green);
    }
  }
}
