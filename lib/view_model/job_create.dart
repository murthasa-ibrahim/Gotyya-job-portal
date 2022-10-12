import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../data/remote/services/job_create.dart';

class JobCreateProvider extends ChangeNotifier {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  validation(String? value) {
    if (value == null || value.isEmpty) {
      return "Feild is required";
    }
    return null;
  }

  List<String> items = [
    "Web designing",
    "Mobile Developement",
    "Web Development",
    "UI/UX Designing",
    "Software Development"
  ];
  String? selectedItem = "Mobile Developement";
  int itemIndex = 1;
  addSelectedItem({
    required String item,
  }) {
    if (item.isEmpty) {
      selectedItem = item;
    }
    itemIndex = items.indexOf(item) + 1;
    log('------$itemIndex');
    notifyListeners();
  }

  void jobCreate() async {
    if (formKey.currentState!.validate()) {
      final response = await JobCreate().jobCreateApi(
        index: itemIndex,
        title: titleController.text,
        description: descriptionController.text,
      );
      if (response != null) {
        
      }
    }
  }

 
}
