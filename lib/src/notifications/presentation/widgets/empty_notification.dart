import 'package:flutter/material.dart';

class EmptyNotificationWidget extends StatelessWidget {
  const EmptyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/carbon_notification.png'),
            const Text(
              textAlign: TextAlign.center,
              'Hello Packer, You dont have any notifications.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                textAlign: TextAlign.center,
                'Notification let you quickly take actions on upcoming current bookings.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
