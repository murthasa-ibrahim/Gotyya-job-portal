import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:project_gotyaa/models/sign_in_model.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';

import '../models/jwt_model.dart';

class SignInService {
   signInRquest(SignInModel data, BuildContext context) async {
    final dio = Dio();
    const uri = ApiEndpoints.baseUrl + ApiEndpoints.signIn;
    try {
     final response = await dio
          .post(uri,
              data: data.toJson(),
              options: Options(headers: {"Content-Type": "application/json"}));
         if (response.statusCode == 200) {
          SignInResponsModel.fromJson(response.data);

          //storingthe token and retrun success
           const storage = FlutterSecureStorage();
           await storage.write(key: 'jwt', value: response.data['access_token']);
           print(response.data['access_token']);
          return 'success';
        
        } else {
          return 'something went wrong ';
        }  
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
           return 'something went wrong';
        } else {
          return e.response?.data['error_description'];
        }
      }
     return e.toString();
    }
  
  }
  
}
