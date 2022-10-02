import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';
import 'package:provider/provider.dart';

import '../view_model/create_profile_provder.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profileProvider = context.read<CreateProfileProvder>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: profileProvider.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        name,
                        style: GoogleFonts.spectral(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Consumer<CreateProfileProvder>(
                  builder: (context, value, child) => ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: value.imageFile == null
                        ? Image.asset('asset/images/proman.jpg',
                            fit: BoxFit.cover,
                            height: size.width * .4,
                            width: size.width * .4)
                        : Image.file(value.imageFile!,
                            fit: BoxFit.cover,
                            height: size.width * .4,
                            width: size.width * .4),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.yellow),
                      onPressed: () {
                        context
                            .read<CreateProfileProvder>()
                            .pickSource(context);
                      },
                      child: const Text(
                        'Add photto',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                MyTextFeild(
                  validator: (value) => profileProvider.validation(value),
                  controller: profileProvider.nameController,
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MyTextFeild(
                    validator: (value) => profileProvider.validation(value),
                    controller: profileProvider.headlineController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Head line',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                MyTextFeild(
                  validator: (value) => profileProvider.validation(value),
                  controller: profileProvider.aboutController,
                  maxLines: 9,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      hintText: 'About',
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      context
                          .read<CreateProfileProvder>()
                          .createProfileRequest(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
