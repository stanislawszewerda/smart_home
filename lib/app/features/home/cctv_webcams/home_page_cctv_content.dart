import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cctv extends StatelessWidget {
  const Cctv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CCTV webcam list', style: GoogleFonts.lobster()),
          Text('This functionality will be avaliable in the future',
              style: GoogleFonts.lobster())
        ],
      ),
    );
  }
}
