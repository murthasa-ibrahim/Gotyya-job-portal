import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project_gotyaa/models/profile_model.dart';
import 'package:project_gotyaa/services/create_profile_api.dart';
import 'package:project_gotyaa/utility/util.dart';

class CreateProfileProvder extends ChangeNotifier {
  //form field controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController headlineController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController startDatecontroller = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  File? imageFile;
  // image picking function
  void chosePIck(ImageSource source, BuildContext context) async {
    final imagPicker = ImagePicker();
    final xfile = await imagPicker.pickImage(source: source);
    if (xfile != null) {
      imageFile = File(xfile.path);
    }
    notifyListeners();
  }

  void pickSource(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose',
              style: GoogleFonts.spectral(
                fontSize: 25,
              )),
          actionsAlignment: MainAxisAlignment.center,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    chosePIck(ImageSource.camera, context);
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 50,
                  )),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  chosePIck(ImageSource.gallery, context);
                },
                icon: const Icon(
                  Icons.image,
                  size: 50,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // date picking code
  void datePicker(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2025));
    if (pickedDate != null) {
      String formatDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
      controller.text = formatDate;
    }
  }

  // profile details list

  ProfileModel? profileDetails;

  // create profile api request

  void createProfileRequest(BuildContext context) async {
    final name = nameController.text;
    final headLine = headlineController.text;
    final about = aboutController.text;
    final image = imageFile;
    final cv = imageFile;
    final obj = ProfileModel(
        firstName: name,
        lastName: headLine,
        dateOfBirth: '2000-09-21',
        profilePhoto: image!,
        cv: cv!,
        about: about);
    ProfileModel? response = await CreateProfileApi().createProfileApi(obj);
    if (response != null) {
      if (response.lastName != null) {
        log('new hiii');
        profileDetails = response;
      } else {
        Utility.displaySnackbar(
            context: context, msg: response.message!, color: Colors.red);
      }
    } else {
      Utility.displaySnackbar(
          context: context, msg: 'No Network Found!', color: Colors.red);
    }
  }
}
