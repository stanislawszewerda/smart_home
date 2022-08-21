import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/welcome.gif'), fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Smart Home',
              style: GoogleFonts.lobster(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                textStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Text(
              'Just for You',
              style: GoogleFonts.lobster(
                fontSize: 30,
                textStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              height: 500,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                //Navigator.of(context).push(
                //MaterialPageRoute(builder: (_) => const SecondPage()));
              },
              child: Text(
                'Rozpocznij',
                style: GoogleFonts.lobster(
                    fontSize: 50,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

