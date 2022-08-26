import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCctvWebcamPage extends StatelessWidget {
  const AddCctvWebcamPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Screan for adding CCTV webcam',
            style: GoogleFonts.lobster(
                textStyle: const TextStyle(color: Colors.amber)))
      ]),
    ));
  }
}
