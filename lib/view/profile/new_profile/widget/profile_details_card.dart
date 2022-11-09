
import 'package:flutter/material.dart';

import '../../../../models/get_profile_model.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    Key? key,required this.profileDetails
  }) : super(key: key);
  final ProfileGetModel profileDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 450,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 58, 49, 74),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Skills',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: const [
                      ChoiceChip(
                          label: Text('flutter'), selected: true),
                      ChoiceChip(
                          label: Text('Dart'), selected: true),
                      ChoiceChip(
                          label: Text('Java'), selected: true),
                      ChoiceChip(
                          label: Text('Getx'), selected: true),
                      ChoiceChip(
                          label: Text('Provider'), selected: true)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        profileDetails.userpro!.about,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                       Text(
                        'Education',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white
                        ),
                      ),
                       SizedBox(
                        height: 10,
                      ),
                    
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
