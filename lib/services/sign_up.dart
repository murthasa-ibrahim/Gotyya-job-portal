

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/sign_up_model.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';





class SignUpRegistration {
  Future<Map?> createUser(SignUpModel user,BuildContext context) async {
   
    final dio = Dio();
    const uri = ApiEndpoints.baseUrl + ApiEndpoints.signUp;
    try {
      Response response = await dio.post(
        uri, 
        data: user.toJson());
      
      if(response.statusCode! >= 200 || response.statusCode! <=299){
         var data = 
         response.data;
        data['success'] = true;
        return data;
      }
      else {

        return response.data;
      }

    } catch (e) {
     if(e is DioError){
      if(e.response?.data == null){
        print(' something went wrong');
      }
   
      // print(e.response!.data['email'][0]);
     return  e.response!.data;
       
     }
    }
    return null;
  }
  
} 