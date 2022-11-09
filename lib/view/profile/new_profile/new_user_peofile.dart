import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_gotyaa/view_model/get_profile_provider.dart';
import 'package:provider/provider.dart';
import '../../../const/constant.dart';
import 'widget/profile_details_card.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetProfileProvider>().oninit();
    return Scaffold(
      body: SafeArea(
        child: Consumer<GetProfileProvider>(
          builder: (context, provider, child) {
            if (provider.profileDetails?.userpro?.id != null) {
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
                      const MyPopupMenu()
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
                          provider.profileDetails!.userpro!.profilePhoto!,
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    provider.profileDetails!.userpro!.firstName ?? 'name',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    provider.profileDetails!.userpro!.lastName ?? 'name',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ProfileDetailsCard(
                      profileDetails: provider.profileDetails!,
                    ),
                  )
                ],
              );
            }
            if (provider.profileDetails?.message != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('asset/json/117326-cat-playing-animation.json'),
                  Text(
                    provider.profileDetails!.message!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            } else {
              return context.read<GetProfileProvider>().shimmerLoading();
            }
          },
        ),
      ),
    );
  }
}

class MyPopupMenu extends StatelessWidget {
 const  MyPopupMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   final controller = context.read<GetProfileProvider>();
    return  PopupMenuButton<SampleItem>(
          initialValue:controller.selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
        
           controller.addToSelectedMenu(item);
           
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('Edit Profile'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('Saved Jobs'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('Log out'),
            ),
          ],
        );
  }
}