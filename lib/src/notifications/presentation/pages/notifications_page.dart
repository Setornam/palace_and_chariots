import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/notifications/presentation/widgets/empty_notification.dart';

import '../../../../shared/theme/color_scheme.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
            'Notifications',
            style: TextStyle(color: lightColorScheme.primary),
          ),
        ),
        body: EmptyNotificationWidget());
  }
}
