
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/get_profile_model.dart';
import 'package:project_gotyaa/data/remote/api_endpoints/api_endpoints.dart';
import 'package:project_gotyaa/utils/util.dart';

class GetCategory {
   getCategoryApi() async {
    try {
      const url = ApiEndpoints.baseUrl + ApiEndpoints.getCategory;
       final token = await Utility.storage.read(key: 'access');
       final dio = Dio();
       dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(url);
      log('2');
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        log('3');
        // return ProfileGetModel.fromJson(response.data);
      } else {
        // return ProfileGetModel(message: "something went wrong");
      }
    } catch (e) {
      
      if (e is DioError) {
        if(e.response == null){
          // return ProfileGetModel(message: "NO network");
        }
        if (e.response?.data == null) {
          log(e.response.toString());
          return ProfileGetModel(message: "something went wrong!");
        } else {
          log('5');
          log(e.response!.data.toString());
          return ProfileGetModel(message: 'Something went wrong!!');
        }
      } else {
        log('6');
        log(e.toString());
        return ProfileGetModel(message: "something went wrong!!!");
      }
    }
  }
}
