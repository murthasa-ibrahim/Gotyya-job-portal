import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/data/remote/api_endpoints/api_endpoints.dart';
import 'package:project_gotyaa/utils/util.dart';

class JobCreate {
  final url = ApiEndpoints.baseUrl + ApiEndpoints.createJob;

  jobCreateApi({required int index,required String title,required String description}) async {
    try {
      final token = await Utility.storage.read(key: "access");
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.post(url, data: {
        "category": [index],
        "job_title": title,
        "job_description": description,
      });
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('Succes');
        log(response.data.toString());
      } else {
        log('something wengt wrong');
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response == null) {
          log('No internet');
        } else if (e.response?.data == null) {
          log("something went wrong!");
        } else {
          log(e.response!.data.toString());
        }
      }
    }
  }
}
