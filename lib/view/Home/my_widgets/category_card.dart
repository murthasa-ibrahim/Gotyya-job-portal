import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/get_category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    context.read<GetCategryProvider>().onInit(context);
    return Consumer<GetCategryProvider>(
      builder: (context, provider, child) => SizedBox(
          height: h * .23,
          width: w,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: w * .7,
                margin: EdgeInsets.all(w * .03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    gradient: const LinearGradient(
                        colors: [Colors.deepOrange, Colors.orange])),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.categoryList[index],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spectral(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemCount: context.read<GetCategryProvider>().categoryList.length,
          )),
    );
  }
}
