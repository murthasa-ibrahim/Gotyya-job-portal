import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/services/get_blogs.dart';

class BlogGetProvider extends ChangeNotifier {
  List<BlogPostModel>? blogList;
  // getListBlog(BuildContext context) async {
  //   final response = await GetBlogsApi().getBlogApi();

  //   if (response != null) {
  //     if (response[0].id != null) {
  //       log('got id');
  //       blogList = response;
  //     } else {
  //       Utility.displaySnackbar(
  //           context: context,
  //           msg: response[0].message ?? 'something went wrong!!!',
  //           color: Colors.red);
  //     }
  //   } else {
  //     Utility.displaySnackbar(
  //         context: context, msg: "Network Not found", color: Colors.red);
  //   }
  // }

  Future<List<BlogPostModel>?> getListBlogs() async {
    final response = await GetBlogsApi().getBlogApi();
    if (response != null) {
      return response;
    }
    return null;
  }
}
