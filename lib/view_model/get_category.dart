

import 'package:flutter/cupertino.dart';
import 'package:project_gotyaa/view_model/get_job_list.dart';
import 'package:provider/provider.dart';

import '../data/remote/services/get_catagory.dart';

class GetCategryProvider extends ChangeNotifier {
  List<String> categoryList = [];
  Future<void> getCatogory() async {
    final response = await GetCategory().getCategoryApi();

    if (categoryList.isEmpty) {
      categoryList = response;
      notifyListeners();
    }
  }

  Future<void> refreshHome(BuildContext context) async {
    await getCatogory();
    await context.read<GetJobListProvider>().getJoblist();
  }

  onInit(BuildContext context) {
    if (categoryList.isEmpty) {
      refreshHome(context);
    }
  }
}
