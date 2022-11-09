import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/get_profile_model.dart';
import 'package:shimmer/shimmer.dart';

import '../const/constant.dart';
import '../data/remote/services/get_profile.dart';

class GetProfileProvider extends ChangeNotifier {
  

  ProfileGetModel? profileDetails;

  getProfileRequest() async {
    final response = await GetProfile().getProfileApi();
    if (response != null) {
      log(response.message.toString());
      profileDetails = response;
      notifyListeners();
    }
  }

  oninit()async {
    if (profileDetails == null) {
    await  getProfileRequest();
    }
  }

SampleItem? selectedMenu;
  void addToSelectedMenu(SampleItem item){
       selectedMenu = item;
       notifyListeners();
  }


  //----------------- shimmer loading-----------------///

  Shimmer shimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: 130,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ))
        ],
      ),
    );
  }
}
