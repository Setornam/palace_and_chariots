import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Confirmation',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.bodySmall,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/check-circle.png'),
              const Text(
                'Congratulations!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Your request was successful',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
