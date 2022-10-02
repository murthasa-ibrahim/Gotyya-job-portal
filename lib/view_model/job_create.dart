import 'package:flutter/cupertino.dart';

import '../data/remote/services/job_create.dart';

class JobCreateProvider extends ChangeNotifier{
void jobCreate()async{
final response = await  JobCreate().jobCreateApi();
if(response != null){
    
}
}
}