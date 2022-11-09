

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:project_gotyaa/models/get_job_list.dart';

import '../data/remote/services/get_job_list.dart';

class GetJobListProvider extends ChangeNotifier {
  List<JobListGetModel> jobList = [];
  List<JobListGetModel> tempList = [];
  getJoblist() async {
    final response = await GetJObList().getJoblistApi();

    if (response != null) {
      
      jobList = response;
    }
    notifyListeners();
  }

  

  onInit()async {
    if (jobList.isEmpty) {
   await  getJoblist();
    }
  }

  // search for job
  searchJobs(String? str){
    if(jobList.isNotEmpty){
         if(str != null && str.isNotEmpty){
      tempList = jobList.where((j) => j.jobTitle!.toLowerCase().startsWith(str.toLowerCase())).toList();
      log(tempList.toString());
      notifyListeners();
    }
    else{
      tempList = jobList;
      notifyListeners();
    }
    }
   
  }
}
