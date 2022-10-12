import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/profile/new_profile/new_user_peofile.dart';
import 'package:project_gotyaa/view_model/sign_out_provider.dart';
import 'package:provider/provider.dart';

import '../profile/edit_profile/edit_profile.dart';


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final signOutProvider = Provider.of<SignOutProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: SafeArea(
          child: 
           Column(
        children: [
          SettingsTile(
            icon: Icons.edit,
            text: 'Edit Profile',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditProfile(),
              ));
            },
          ),
          SettingsTile(
            icon: Icons.save,
            text: 'Saved Jobs',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const  UserProfile(),));
            },
          ),
          SettingsTile(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
                signOutProvider.signOut(context);
                
            },
          ),
        ],
      )
      // :const  Center(child: CircularProgressIndicator(color: Colors.teal,),)
      )
      
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final GestureTapCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: onTap,
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
