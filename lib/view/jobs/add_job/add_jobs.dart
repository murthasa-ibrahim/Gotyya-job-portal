import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';
import 'package:project_gotyaa/view_model/job_create.dart';
import 'package:provider/provider.dart';


class AddJob extends StatelessWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<JobCreateProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: Colors.white,
                          )),
                      Text(
                        'Add New Job',
                        style: GoogleFonts.spectral(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Job title',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  MyTextFeild(
                    controller: provider.titleController,
                    validator: (value)=> provider.validation(value),
                    maxLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Category',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // const CategoryDropDown(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.spectral(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  MyTextFeild(
                    maxLines: 10,
                     validator: (value)=> provider.validation(value),
                    controller: provider.descriptionController,
                    decoration: InputDecoration(
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
                          provider.jobCreate();
                        },
                        child: Text(
                          'Submit',
                          style: GoogleFonts.spectral(fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
