import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/data/remote/api_endpoints/api_endpoints.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/utils/util.dart';

class GetBlogsApi {
  Future<List<BlogPostModel>>? getBlogApi() async {
    try {
      const url = ApiEndpoints.baseUrl + ApiEndpoints.getBlogList;
      final token = await Utility.storage.read(key: 'access');
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["Content-Type"] = "application/json";

      final response = await dio.get(
        url,
      );
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
        if (e.response == null) {
          return [BlogPostModel(message: "No Network!!")];
        }
        if (e.response?.data == null) {
          log(e.response.toString());
          return [BlogPostModel(message: "something went wrong!")];
        } else {
          log('5');
          log(e.response!.data.toString());
          log(e.response!.statusCode.toString());
          return [BlogPostModel(message: "Something went wrong")];
        }
      } else {
        log('6');
        log(e.toString());
        return [BlogPostModel(message: "something went wrong!!")];
      }
    }
  }
}
