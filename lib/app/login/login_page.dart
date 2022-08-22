//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:smart_home/app/welcome/welcome_page.dart';
//import 'firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final emailcontroler = TextEditingController();

final passwordcontroler = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/window.jpg'), fit: BoxFit.cover),
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
            const SizedBox(height: 1),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(20.0),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(99, 0, 0, 0)),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusColor: const Color.fromARGB(255, 255, 255, 255),
                        border: const OutlineInputBorder(),
                        label: const Center(child: Text('E-mail')),
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      controller: emailcontroler,
                      style: GoogleFonts.lobster(
                          fontSize: 20,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    TextFormField(
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusColor: const Color.fromARGB(255, 255, 255, 255),
                        border: const OutlineInputBorder(),
                        label: const Center(child: Text('Password')),
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      controller: passwordcontroler,
                      style: GoogleFonts.lobster(
                          fontSize: 20,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailcontroler.text,
                            password: passwordcontroler.text,
                          );
                        } catch (error) {
                          print(error);
                        }
                      },
                      child: Text(
                        'Zaloguj',
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Zarejestruj się',
                        style: GoogleFonts.lobster(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ekran startowy',
                style: GoogleFonts.lobster(
                  fontSize: 10,
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
