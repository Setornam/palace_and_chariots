import 'package:flutter/material.dart';

import '../../../shared/theme/color_scheme.dart';
import '../../checkout/presentation/pages/security_checkout_page.dart';
import '../security/domain/entities/security.dart';

class SecurityDetailPage extends StatefulWidget {
  final Security security;
  const SecurityDetailPage({super.key, required this.security});

  @override
  State<SecurityDetailPage> createState() => _SecurityDetailPageState();
}

class _SecurityDetailPageState extends State<SecurityDetailPage> {
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
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    ' Security',
                    style: TextStyle(color: lightColorScheme.primary),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
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
                      image: AssetImage('assets/images/SecurityDetail.png'))),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
            widget.security.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
             Text(widget.security.description),
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                'This service is available for',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text('Individuals'),
            const Text('Families'),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightColorScheme.primary,
                      minimumSize: const Size.fromHeight(40),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SecurityCheckoutPage()));
                    },
                    child: const Text(
                      'Request',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
