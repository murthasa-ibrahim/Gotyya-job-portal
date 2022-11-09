import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view_model/get_category.dart';
import 'package:provider/provider.dart';

import '../my_widgets/category_card.dart';
import '../my_widgets/job_card.dart';
import '../my_widgets/my_appbar.dart';
import '../my_widgets/my_floating_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          backgroundColor: Colors.white,
          color: Colors.teal,
          onRefresh: () async =>
              await context.read<GetCategryProvider>().refreshHome(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(h: h),
                CategoryCard(h: h, w: w),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
                  child: Text(
                    'Jobs For You',
                    style: GoogleFonts.spectral(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                JobCard(w: w),
              ],
            ),
          ),
        ),
        floatingActionButton: const MyFloatingButton(),
      ),
    );
  }
}
