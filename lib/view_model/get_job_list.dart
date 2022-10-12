

import 'package:flutter/cupertino.dart';
import 'package:project_gotyaa/models/get_job_list.dart';

import '../data/remote/services/get_job_list.dart';

class GetJobListProvider extends ChangeNotifier {
  List<JobListGetModel> jobList = [];
  getJoblist() async {
    final response = await GetJObList().getJoblistApi();

    if (response != null) {
      if (response[0].message != null) {
        // throw response[0].message!;
      }
      jobList = response;
    }
    notifyListeners();
  }

  

  onInit()async {
    if (jobList.isEmpty) {
   await  getJoblist();
    }
  }
}
