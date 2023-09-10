import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:palace_and_chariots/src/profile/presentation/pages/edit_profile_page.dart';
import 'package:palace_and_chariots/src/profile/presentation/pages/settings_page.dart';
import 'package:palace_and_chariots/src/sign_in/presentation/pages/sign_in_page.dart';

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
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('id',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return SizedBox(
                    height: 300,
                    child: ListView(
                        children: documents
                            .map((doc) => Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    doc['profile_image_url'] == null ||
                                            doc['profile_image_url'] == ''
                                        ? CircleAvatar(
                                            radius: 60,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile.png'))
                                        : CircleAvatar(
                                            radius: 60,
                                            backgroundImage: NetworkImage(
                                                doc['profile_image_url'])),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        '${doc['first_name']}  ${doc['last_name']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        doc['email_address'],
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6))),
                                            backgroundColor:
                                                lightColorScheme.primary),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          EditProfilePage()));
                                        },
                                        child: const Text('Edit Profile'))
                                  ],
                                ))
                            .toList()),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Text('Error');
                  }
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
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
              onTap: () {
                var auth = FirebaseAuth.instance;
                auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignInPage()));
              },
              leading: const Icon(IconlyBold.logout),
              title: const Text('Log out'),
            )
          ],
        ),
      ),
    );
  }
}
