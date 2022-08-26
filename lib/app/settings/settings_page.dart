import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('SETTINGS FOR YOUR APP',
            style: GoogleFonts.lobster(
                textStyle: const TextStyle(color: Colors.amber)))
      ]),
    ));
  }
}
