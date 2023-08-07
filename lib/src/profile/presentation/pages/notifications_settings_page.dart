import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../shared/theme/color_scheme.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  ValueNotifier<bool> isChatBoxNotificationOn = ValueNotifier(false);
  ValueNotifier<bool> isTravelTourismNotificationOn = ValueNotifier(false);
  ValueNotifier<bool> isRentalsNotificationOn = ValueNotifier(false);
  ValueNotifier<bool> isSecurityNotificationOn = ValueNotifier(false);
  ValueNotifier<bool> isSalesNotificationOn = ValueNotifier(false);
  ValueNotifier<bool> isUpcomingDealsNotificationOn = ValueNotifier(false);

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
            'Notifications',
            style: TextStyle(color: lightColorScheme.primary),
          ),
        ),
        body: ListView(
          children: [
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return SwitchListTile(
                    activeTrackColor: lightColorScheme.primary,
                    title: const Text(
                      'Chat box',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'When your chat receives a reply',
                    ),
                    onChanged: (bool value) {
                      isChatBoxNotificationOn.value =
                          !isChatBoxNotificationOn.value;
                    },
                    value: isChatBoxNotificationOn.value);
              },
              valueListenable: isChatBoxNotificationOn,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return SwitchListTile(
                      activeTrackColor: lightColorScheme.primary,
                      title: const Text(
                        'Travel/Tourism ideas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Search reminders, recommendations for stays, flights and attractions ',
                      ),
                      onChanged: (bool value) {
                        isTravelTourismNotificationOn.value =
                            !isTravelTourismNotificationOn.value;
                      },
                      value: isTravelTourismNotificationOn.value);
                },
                valueListenable: isTravelTourismNotificationOn,
              ),
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return SwitchListTile.adaptive(
                    activeTrackColor: lightColorScheme.primary,
                    title: const Text(
                      'Rentals',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Search reminders, recommendations for cars, accommodation  and event space ',
                    ),
                    onChanged: (bool value) {
                      isRentalsNotificationOn.value =
                          !isRentalsNotificationOn.value;
                    },
                    value: isRentalsNotificationOn.value);
              },
              valueListenable: isRentalsNotificationOn,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return SwitchListTile(
                      activeTrackColor: lightColorScheme.primary,
                      title: const Text(
                        'Security',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Search reminders, recommendations for security ',
                      ),
                      onChanged: (bool value) {
                        isSecurityNotificationOn.value =
                            !isSecurityNotificationOn.value;
                      },
                      value: isSecurityNotificationOn.value);
                },
                valueListenable: isSecurityNotificationOn,
              ),
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return SwitchListTile(
                    activeTrackColor: lightColorScheme.primary,
                    title: const Text(
                      'Sales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Search reminders, recommendations for cars and house ',
                    ),
                    onChanged: (bool value) {
                      isSalesNotificationOn.value =
                          !isSalesNotificationOn.value;
                    },
                    value: isSalesNotificationOn.value);
              },
              valueListenable: isSalesNotificationOn,
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return SwitchListTile(
                    activeTrackColor: lightColorScheme.primary,
                    title: const Text(
                      'Upcoming deals',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Discount , offers, seasonal promotions',
                    ),
                    onChanged: (bool value) {
                      isUpcomingDealsNotificationOn.value =
                          !isUpcomingDealsNotificationOn.value;
                    },
                    value: isUpcomingDealsNotificationOn.value);
              },
              valueListenable: isUpcomingDealsNotificationOn,
            ),
          ],
        ));
  }
}
