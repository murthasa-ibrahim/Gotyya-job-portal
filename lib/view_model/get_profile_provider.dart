import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_gotyaa/models/get_profile_model.dart';
import 'package:shimmer/shimmer.dart';

import '../data/remote/services/get_profile.dart';
import '../utils/util.dart';

class GetProfileProvider extends ChangeNotifier {
  bool noProfile = true;

  setProfileStatus() async {
    noProfile = false;
    const storage = FlutterSecureStorage();
    await storage.write(key: 'status', value: "false");
    notifyListeners();
  }

  Future<bool> checkProfileStatus() async {
    final status = await Utility.storage.read(key: "status");
    if (status == "false") {
      noProfile = false;
    }
    return true;
  }

  ProfileGetModel? profileDetails;
  // checkProfileStatus() {
  //   noProfile = false;
  //   notifyListeners();
  // }

  getProfileRequest() async {
    final response = await GetProfile().getProfileApi();
    if (response != null) {
      log(response.message.toString());
      profileDetails = response;
      notifyListeners();
    }
  }

  oninit() {
    if (profileDetails == null) {
      getProfileRequest();
      notifyListeners();
    }
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
