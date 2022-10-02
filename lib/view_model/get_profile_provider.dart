
import 'package:flutter/cupertino.dart';
import 'package:project_gotyaa/models/get_profile_model.dart';

import '../data/remote/services/get_profile.dart';


class GetProfileProvider extends ChangeNotifier{

  bool noProfile = true;

Future<ProfileGetModel?> getProfileRequest()async{
  final response = await  GetProfile().getProfileApi();
  if(response != null){ 
    if(response.message!=null){
      throw response.message!;
      
    }
    return response;
    
  }    
  return null;

























  
    
  }
}