import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

class DestinationSearchPage extends StatefulWidget {
  const DestinationSearchPage({super.key});

  @override
  State<DestinationSearchPage> createState() => _DestinationSearchPageState();
}

class _DestinationSearchPageState extends State<DestinationSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 90,
      elevation: 0,
      backgroundColor: Colors.white,
      title:  Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 30,),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey.withOpacity(.5)
                ),
              ),
              prefixIcon: Icon(Icons.arrow_back,color: Colors.black87,),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'Enter destination',
              labelStyle: TextStyle(color: Colors.black87),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: lightColorScheme.primary),
                  borderRadius:
                  BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe7e9f4)),
                  borderRadius:
                  BorderRadius.all(Radius.circular(5))),
              fillColor: Color(0xffe7e9f4),
            ),
          ),
        ),
      ),

    ));
  }
}
