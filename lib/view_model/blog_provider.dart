import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/utils/util.dart';

import '../data/remote/services/create_blog_api.dart';

class BlogProvider extends ChangeNotifier {
static const String AVAILABLE='gcgv';
  final headlineController = TextEditingController();
  final contentController = TextEditingController();
  Future<void> createBlog(BuildContext context) async {
    final obj = BlogPostModel(
        title: headlineController.text, content: contentController.text);
    final response = await BlogService().createBlogApi(obj);
    if (response != null) {
      if (response.content != null) {
        log(response.content.toString());
        headlineController.clear();
        contentController.clear();
        Utility.displaySnackbar(
            context: context,
            msg: "Blog added Successfully",
            color: Colors.green);
      } else {
        Utility.displaySnackbar(
            context: context,
            msg: response.message ?? 'something went wrong!!',
            color: Colors.red);
      }
    } else {
      Utility.displaySnackbar(
          context: context, msg: 'No Network Found!', color: Colors.red);
    }
  }
}
