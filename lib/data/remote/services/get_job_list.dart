
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/get_job_list.dart';
import 'package:project_gotyaa/data/remote/api_endpoints/api_endpoints.dart';
import 'package:project_gotyaa/utils/util.dart';

class GetJObList {
 Future<List<JobListGetModel>>?  getJoblistApi() async {
    try {
      const url = ApiEndpoints.baseUrl + ApiEndpoints.getJobList;
       final token = await Utility.storage.read(key: 'access');
       final dio = Dio();
       dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(url);

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        // log(response.toString());
        log('3');
       
        var a= JobListGetModel.jobListGetModelFromJson(response.data);
        log(a.toString());
        return a;

      } else {
        return [JobListGetModel(message: "something went wrong")];
      }
    } catch (e) {
      
      if (e is DioError) {
        if(e.response == null){
          return [JobListGetModel(message: "No network")];
        }
        if (e.response?.data == null) {
          // log(e.response.toString());
          return [JobListGetModel(message: "something went wrong!")];
        } else {
          log('5');
          log(e.response!.data.toString());
          return [JobListGetModel(message: 'Something went wrong!!')];
        }
      } else {
        log('6');
        log(e.toString());
        return [JobListGetModel(message: "something went wrong!!!")];
      }
    }
  }
}
