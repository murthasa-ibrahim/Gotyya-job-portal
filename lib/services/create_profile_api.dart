import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/profile_model.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';
import 'package:project_gotyaa/utility/util.dart';

class CreateProfileApi {
  Future<ProfileModel>? createProfileApi(ProfileModel obj) async {

    FormData formData = FormData.fromMap({
      "profile_photo": await MultipartFile.fromFile(obj.profilePhoto!.path,
          filename: obj.profilePhoto!.path.split('/').last),
      "cv": await MultipartFile.fromFile(obj.cv!.path,
          filename: ProfileModel().getFileName(obj.profilePhoto!)),
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
        log(response.data);
        return ProfileModel.fromJson(response.data);
      } else {
        log('something went wrong');
        return ProfileModel(message: response.data['message']);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          return ProfileModel(message: 'Something went wrong!');
        }
        log(e.response.toString());
         log('2');
        return ProfileModel(
          message: e.response.toString(),
        );
      } else {
        log('3');
        return ProfileModel(message: e.toString());
      }
    }
  }
}
