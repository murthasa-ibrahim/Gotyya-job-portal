

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:project_gotyaa/data/remote/api_endpoints/api_endpoints.dart';
// import 'package:project_gotyaa/utils/util.dart';

// class ApiInterceptor {
//   String? access;
//   Future<Dio> getApiClient() async {
//     access = await Utility.storage.read(key: "access");
//      final refresh = await Utility.storage.read(key: "access");
//     Dio dio = Dio();
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (request, handler) {
//         if (access != null && access != '') {
//           request.headers['Authorization'] = 'Bearer $access';
//           return handler.next(request);
//         }
//       },
//       onResponse:(response,handler ){
//            return handler.next(response);
//       },
//       onError: (DioError e, handler)async{
//           if(e.response?.statusCode == 401){
           
//             try{
//               await dio.post(ApiEndpoints.baseUrl+ApiEndpoints.refreshToken,data: {
//                 "refresh": refresh
//               }).then((value)async{
//                  if (value.statusCode! >= 200 && value.statusCode! <= 299 ) {
//                   log(value.data.toString());
//                  final  token = value.data["access"]; 
//                   e.requestOptions.headers["Authorization"] = "Bearer $token";
//                   final opts = Options(
//                      method: e.requestOptions.method,
//                      headers: e.requestOptions.headers);
//                      final cloneReq = await dio.request(e.requestOptions.path,
//                           options: opts,
//                           data: e.requestOptions.data,
//                           queryParameters: e.requestOptions.queryParameters);
//                           return handler.resolve(cloneReq); 
//                  }
//                  return handler.next(e);
//             });
            
                 
              


//             }catch(e){
//               log(e.toString());
//             }
//           }
//       }
//     ));
//   }
// }
