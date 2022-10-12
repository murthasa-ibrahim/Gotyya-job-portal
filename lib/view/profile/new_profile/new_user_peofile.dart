import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_gotyaa/view_model/get_profile_provider.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetProfileProvider>().oninit();
    return Scaffold(
      body: SafeArea(
          child: Consumer<GetProfileProvider>(builder: (context, value, child) {
        if (value.profileDetails?.userpro?.id != null) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
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
              ),
              Container(
                height: 140,
                width: 140,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      value.profileDetails!.userpro!.profilePhoto!,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                value.profileDetails!.userpro!.firstName ?? 'name',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                value.profileDetails!.userpro!.lastName ?? 'name',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                    value.profileDetails!.userpro!.about,
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
                                  // Text(
                                  //   'Lorem IPsum and some oft hte data',
                                  //   style:  TextStyle(
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.bold,
                                  //     // color: Colors.white
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
        if (value.profileDetails?.message != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('asset/json/117326-cat-playing-animation.json'),
              Text(
                value.profileDetails!.message!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          );
        } else {
          return context.read<GetProfileProvider>().shimmerLoading();
        }
      })),
    );
  }
}
