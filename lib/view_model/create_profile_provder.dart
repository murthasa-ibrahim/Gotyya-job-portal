import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_gotyaa/models/profile_model.dart';
import 'package:project_gotyaa/utils/util.dart';
import 'package:project_gotyaa/view_model/get_profile_provider.dart';
import 'package:provider/provider.dart';

import '../data/remote/services/create_profile_api.dart';

class CreateProfileProvder extends ChangeNotifier {
//--------------- fuction to covert asset image to file-------------//
//   Future<File> getImageFileFromAssets(String path) async {
//     final byteData = await rootBundle.load(path);
// // final file = File('${(await path_provider.getExternalStorageDirectory())!.path}/$path');
// //  file.createSync();
//     final file = File('${(await getTemporaryDirectory()).path}/$path');
//     // log(file.path);
//     await file.writeAsBytes(byteData.buffer
//         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

//     return file;
//   }

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);

  final file = File('${(await getTemporaryDirectory()).path}/.jpg');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}


















  //form field controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController headlineController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController startDatecontroller = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

//--------validation function-----------///

  String? validation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This feild is requierd';
    }
    return null;
    
  }

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
    if (formKey.currentState!.validate()) {
      File image;

      imageFile != null
          ? image = imageFile!
          : image = await getImageFileFromAssets('asset/images/avathar.jpg');
      final name = nameController.text;
      final headLine = headlineController.text;
      final about = aboutController.text;
      // final cv = image;

      final obj = ProfileModel(
          firstName: name,
          lastName: headLine,
          dateOfBirth: '2000-09-21',
          profilePhoto: image.path,
          cv: image.path,
          about: about);
      log('me');
      ProfileModel? response = await CreateProfileApi().createProfileApi(obj);
      if (response != null) {
        if (response.lastName != null) {
          context.read<GetProfileProvider>().noProfile = false;
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
}
