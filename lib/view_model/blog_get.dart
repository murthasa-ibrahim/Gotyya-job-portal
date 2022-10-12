import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/blog_create.dart';

import '../data/remote/services/get_blogs.dart';

class BlogGetProvider extends ChangeNotifier {
  List<BlogPostModel>? blogList;

  Future<void> getListBlogs() async {
    final response = await GetBlogsApi().getBlogApi();

    if (response != null) {
      if (response[0].message != null) {
        // throw response[0].message!;
       
      } else {
        blogList = response;
        notifyListeners();
      }
    }
  }

  onInit() {
    if (blogList == null) {
      blogRefresh();
    }
  }

  Future<void> blogRefresh() async {
    await getListBlogs();
    notifyListeners();
  }
}
