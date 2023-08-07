import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:palace_and_chariots/src/profile/presentation/pages/edit_profile_page.dart';
import 'package:palace_and_chariots/src/profile/presentation/pages/settings_page.dart';

import '../../../../shared/theme/color_scheme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: lightColorScheme.primary),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Esther Fisher',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'esther@gmail.com',
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        backgroundColor: lightColorScheme.primary),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EditProfilePage()));
                    },
                    child: const Text('Edit Profile'))
              ],
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SettingsPage()));
              },
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(IconlyBold.logout),
              title: const Text('Log out'),
            )
          ],
        ),
      ),
    );
  }
}
