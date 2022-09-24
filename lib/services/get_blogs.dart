import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';

class GetBlogsApi {
  Future<List<BlogPostModel>>? getBlogApi() async {
    try {
      const url = ApiEndpoints.baseUrl + ApiEndpoints.getBlogList;
      //  final token = Utility.storage.read(key: 'access');
      //  final dio = Dio();
      //  dio.options.headers["authorization"] = "Beare $token";
      //  dio.options.headers["Content-Type"] = "application/json";

      final response = await Dio().get(url);
      log('2');
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        log('3');
        return BlogPostModel().blogGetModelFromJson(response.data);
      } else {
        return [BlogPostModel(message: "something went wrong")];
      }
    } catch (e) {
      if (e is DioError) {
        log('4');
        if (e.response?.data == null) {
          log(e.response.toString());
          return [BlogPostModel(message: "something went wrong!")];
        } else {
          log('5');
          log(e.response?.data);
          return [BlogPostModel(message: e.response?.data)];
        }
      } else {
        log('6');
        log(e.toString());
        return [BlogPostModel(message: "something went wrong!!")];
      }
    }
  }
}
