import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';

import '../utility/util.dart';

class BlogService {
  Future<BlogPostModel>? createBlogApi(BlogPostModel obj) async {
    log('here');
    const uri = ApiEndpoints.baseUrl + ApiEndpoints.createblog;
    final token = await Utility.storage.read(key: 'access');
    final dio = Dio();

   
    try {
      
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.contentType = 'application/json';
      final response = await dio
          .post(uri, data: obj.toJson());
       log('new log');
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
         log('log1');
        log(response.data.toString());
        return BlogPostModel.fromJson(response.data);
      } else {
        log('log2');
        return BlogPostModel(message: "something went wrong");
      }
      
    } 
    
    catch (e) {
      if(e is SocketException){
         log('network error');
         return  BlogPostModel(message: 'network error');
      }
      if (e is DioError) {
        
        if (e.response?.data == null) {
          log('log3');
          return BlogPostModel(message: 'Something went wrong!');
        }
       
         log('5');
         log(e.response.toString());
        return BlogPostModel(
          message: 'something went wrong!!',
        );
      } else {
        log('log4');
        return BlogPostModel(message: e.toString());
      }
    }
  }
}
