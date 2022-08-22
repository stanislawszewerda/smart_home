//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:smart_home/app/welcome/welcome_page.dart';
//import 'firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: const [
          Text('HOMEPAGE'),
        ],
      )),
    );
  }
}
