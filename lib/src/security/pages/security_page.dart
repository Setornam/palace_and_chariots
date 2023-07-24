import 'package:flutter/material.dart';

import '../../../shared/theme/color_scheme.dart';
import '../widgets/high_profile_security.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                    ),
                    const Text(
                      'Back',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    'Security',
                    style: TextStyle(color: lightColorScheme.primary),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HighProfileSecurityPage()));
              },
              child: Column(
                children: [
                  Container(
                    height: 140,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/PersonalSecurity.png'))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Personal Security',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
