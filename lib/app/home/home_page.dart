import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/welcome/welcome_page.dart';
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
      appBar: AppBar(
          title: Center(
            child: Column(
              children: [
                Text('Smart Home', style: GoogleFonts.lobster(fontSize: 30)),
                Text('Just for you', style: GoogleFonts.lobster(fontSize: 10)),
              ],
            ),
          ),
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.menu),
          )),
      body: Center(
        child: ListView(
          children: [
            const Text('HOMEPAGE'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                'Wyloguj się',
                style: GoogleFonts.lobster(
                  fontSize: 10,
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const WelcomePage()));
              },
              child: Text(
                'Zobacz ekran powitalny',
                style: GoogleFonts.lobster(
                  fontSize: 10,
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
