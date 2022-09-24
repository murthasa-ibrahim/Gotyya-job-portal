import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_gotyaa/models/sign_up_model.dart';
import 'package:project_gotyaa/models/signup_response_model.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';

class SignUpRegistration {
  Future<SignUpResponsModel>? createUser(
    SignUpModel user,
  ) async {
    const uri = ApiEndpoints.baseUrl + ApiEndpoints.signUp;
    try {
      final response = await Dio().post(uri, data: user.toJson());
       log(response.statusCode.toString());
       log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.toString());
        log('log1');
  
        return SignUpResponsModel.fromJson(response.data);
      } else {
        log('something went wrong');
        log('log2');
        return SignUpResponsModel(message: response.data['message']);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          log('log3');
          return SignUpResponsModel(message: 'Something went wrong!');
          
        }
       
        if (e.response?.data.containsKey('username')) {
          log('log4');
          return SignUpResponsModel(message: e.response!.data['username'][0]);
        } else if (e.response?.data.containsKey('email')) {
          return SignUpResponsModel(message: e.response!.data['email'][0]);
        } else {
          return SignUpResponsModel(
            message: e.response!.data['password'][0],
          );
        }
      } else {
         log('log5');
         log(e.toString());
         
        return SignUpResponsModel(message:'something went wrong!');
      }
    }
  }
}
