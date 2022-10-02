import 'package:flutter/cupertino.dart';

import '../data/remote/services/get_catagory.dart';

class GetCategryProvider extends ChangeNotifier {
  getCatogory() async {
    GetCategory().getCategoryApi();
    // final response = await  GetProfile().getProfileApi();
    // if(response != null){
    //   if(response.message!=null){
    //     throw response.message!;
    //   }
    //   return response;

    // }
    // return null;
  }
}
