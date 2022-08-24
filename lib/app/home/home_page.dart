import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/welcome/welcome_page.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:smart_home/app/welcome/welcome_page.dart';
//import 'firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

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
        ),
      ),

      ///
      ///
      ///
      ///
      ///Umieścić przyciski oraz tekst w dodanym container
      ///
      ///
      ///
      body: Center(
        child: ListView(
          children: [
            Container(
              child: const Text('lolololo'),
              color: Colors.amber,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
            ),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home Page'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account')
        ],
      ),
    );
  }
}
