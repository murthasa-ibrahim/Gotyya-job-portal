import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:project_gotyaa/models/sign_in_model.dart';
import 'package:project_gotyaa/services/api_endpoints.dart';
import 'package:project_gotyaa/utility/util.dart';

import '../models/sign_response.dart';

class SignInService {
  Future<SignInResponsModel> signInRquest(
      SignInModel data, BuildContext context) async {
    final dio = Dio();
    const uri = ApiEndpoints.baseUrl + ApiEndpoints.signIn;
    try {
      final response = await dio.post(uri,
          data: data.toJson(),
          options: Options(headers: {"Content-Type": "application/json"}));

      if (response.statusCode == 200) {
        //storingthe token and retrun success

        await Utility.storage
            .write(key: 'access', value: response.data['access']);
        log( response.data['access'].toString());

        return SignInResponsModel.fromJson(response.data);
      } else {
        return SignInResponsModel(message: "something went wrong");
      }
    }  catch (e) {
      if (e is DioError) {
        if (e is SocketException) {
          log('no inter');
        }
        if (e.response?.data== null) {
          return SignInResponsModel(message: "Something went wrong!");
        } else {
          log(e.response.toString());
          log('2');
          return SignInResponsModel(message: e.response!.data['detail']);
        }
      }
      log(e.toString());
      return SignInResponsModel(message: "Something went wrong!!");
    }
  }
}
