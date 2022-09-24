// import 'package:dio/dio.dart';
// import 'package:project_gotyaa/models/sign_out_model.dart';
// import 'package:project_gotyaa/services/api_endpoints.dart';

// class SignOutService{
//   signOutApi(SignOutModel model)async{
//     final dio = Dio();
//     const  uri = ApiEndpoints.baseUrl+ApiEndpoints.logout;
//    try{
//     Response response = await dio.post(uri,data: model.toJson());
//    if(response.statusCode == 204){
//     return 'success';
//    }
//    else{
//     return 'something went wrong';
    
//    }
//    }
//     on DioError catch(e){
//       if(e.response?.data == null){
//         return 'something went wrogn';  
//       }
//       return 'error';
//     }

//   }
// }