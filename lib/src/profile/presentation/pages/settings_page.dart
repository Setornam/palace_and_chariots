import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:palace_and_chariots/src/profile/presentation/pages/notifications_settings_page.dart';

import '../../../../shared/theme/color_scheme.dart';
import 'about_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          automaticallyImplyLeading: true,
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Settings',
            style: TextStyle(color: lightColorScheme.primary),
          ),
        ),
        body: Column(
          children: [
            const ListTile(
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              subtitle: Text('This will take you to your system settings'),
              title: Row(
                children: [
                  Text(
                    'Language',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'English (UK)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const NotificationSettingsPage()));
              },
              title: const Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const AboutPage()));
              },
              title: const Text(
                'About Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ));
  }
}
