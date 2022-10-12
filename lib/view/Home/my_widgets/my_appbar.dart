import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/get_profile_provider.dart';
import '../../profile/create_profile/cteate_profile.dart';
import '../../profile/new_profile/new_user_peofile.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.h,
  }) : super(key: key);

  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * .25,
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.sentiment_satisfied_outlined)),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Gotyaa',
                style: GoogleFonts.spectral(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                     context.read<GetProfileProvider>().checkProfileStatus();
                  // checkProfileStatus();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          context.read<GetProfileProvider>().noProfile
                              ? const CreateProfile(
                                  name: "Create your Profile",
                                )
                              : const UserProfile()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'asset/images/proman.jpg',
                    fit: BoxFit.cover,
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50, child: CupertinoSearchTextField()),
          Text(
            'Categories',
            style:
                GoogleFonts.spectral(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
