

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_gotyaa/models/get_profile_model.dart';
import 'package:project_gotyaa/view_model/get_profile_provider.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<ProfileGetModel?>(
        future: context.read<GetProfileProvider>().getProfileRequest(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('asset/json/117326-cat-playing-animation.json'),
                Text(
                  snapshot.error.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_sharp))
                  ],
                ),
                Container(
                  height: 140,
                  width: 140,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: snapshot.data!.userpro!.profilePhoto == null || snapshot.data!.userpro!.profilePhoto!.isEmpty
                          ? Image.asset(
                              'asset/images/man.jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              snapshot.data!.userpro!.profilePhoto!,
                              fit: BoxFit.cover,
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot.data!.userpro!.firstName ?? 'name',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  snapshot.data!.userpro!.lastName ?? 'name',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 450,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 58, 49, 74),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Expanded(
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
                                      color: Colors.white
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:const [
                                      ChoiceChip(
                                        
                                          label: Text('flutter'),
                                          selected: true),
                                      ChoiceChip(
                                          label: Text('Dart'),
                                          selected: true),
                                      ChoiceChip(
                                          label: Text('Java'),
                                          selected: true),
                                      ChoiceChip(
                                          label: Text('Getx'),
                                          selected: true),
                                      ChoiceChip(
                                          label: Text('Provider'),
                                          selected: true)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
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
                                      snapshot.data!.userpro!.about,
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
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Education',
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
                                      snapshot.data!.userpro!.about,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
