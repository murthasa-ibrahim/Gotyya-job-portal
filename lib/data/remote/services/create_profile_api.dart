import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/profile_model.dart';
import 'package:project_gotyaa/data/remote/api_endpoints/api_endpoints.dart';
import 'package:project_gotyaa/utils/util.dart';


class CreateProfileApi {
  Future<ProfileModel>? createProfileApi(ProfileModel obj) async {
    log('got it');
    FormData formData = FormData.fromMap({
      "profile_photo": await MultipartFile.fromFile(obj.profilePhoto!,
          filename: obj.profilePhoto!.split('/').last),
      "cv": await MultipartFile.fromFile(obj.cv!,
          filename:  obj.profilePhoto!.split('/').last),
      "first_name": obj.firstName,
      "last_name": obj.lastName,
      "date_of_birth": obj.dateOfBirth,
      "about": obj.about
    });

    final dio = Dio();
    const uri = ApiEndpoints.baseUrl + ApiEndpoints.createProfile;
    final jwt = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $jwt";
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await dio.post(
        uri,
        data: formData,
      );

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('1');
        log(response.data.toString());
         return ProfileModel.fromJson(response.data);
      } else {
        log('something went wrong');
        return ProfileModel(message: response.data['message']);
      }
    } catch (e) {
      if (e is DioError) {
        if(e.response == null){
          return ProfileModel(message: "No Internet");
        }
        if (e.response?.data == null) {
           log(e.response.toString());
          return ProfileModel(message: 'Something went wrong!');
        }
        log(e.response.toString());
        log('2');
        return ProfileModel(
          message: "something went wrong!!",
        );
      } else {
        log('3');
        log(e.toString());
        return ProfileModel(message: e.toString());
      }
    }
  }
}
