//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:smart_home/app/welcome/welcome_page.dart';
//import 'firebase_options.dart';

//Login: stachuf16@gmail.com
//Hasło: stachu14d

/// Strona LoginPage umożliwia zalogowanie się użytkownika lub jego rejestrację w serwisie SmartHome
///
///
///
// Login Page - StatefulWidget umożliwia stosowania zmiennych które można modyfikować ja np. zmienna VAR
// w przciwienstiwe do stateless widget który pozwala tylko na na stosowanie zmiennych przechowujacych
// cały czas te same wartości
// final sam wykrywa typ zmiennej
// var tak samo wykrywa typ zmiennej

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  // Po przerobieniu StatelessWidgeta na StatefulWidget tworzy się miejsce na
  // trzymanie zmiennych FINAL - należy je trzymać w tym miejscu
  // zaraz po LoginPage, przenosimy je więc w górę
  // Przed każdym errorem w kodzie który pojawia się po przeniesieniu należy
  // dodać
  // widget.

  final emailcontroler = TextEditingController();

  final passwordcontroler = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

///
///
/// w drugiej klasie (w tym przypadku) _LoginaPageState
/// trzyma sie pozostałe zmienne tj. VAR
///
///

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';

  FocusNode myFocusNode =
      FocusNode(); // FucusNode - w dlaszej czesci kodu pozwoli na obsługę koloru wypełnienia TextFormFielda Labelem

  var isCreatingAccount = false;

  ///
  ///
  ///
  ///

  @override
  Widget build(BuildContext context) {
    // Scaffold pozwala rozpoczać budowanie ekranu można go zawsze wyekstraktować jako osobny widget
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body:
          // Container to prostokąt w którym można trzymać zawartość, buttony, textfieldy itd.
          Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              // AssetImage - jest funkcjonalnością którą jakoś trzeba implementować w Pubspcec.Yaml!!!
              // Fit: BoxFit.Cover umożliwia dodanie zdjęcia
              image: AssetImage('images/window.jpg'),
              fit: BoxFit.cover),
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

            ///
            ///
            ///
            ///
            ///
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(20.0),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(99, 0, 0, 0)),
              child: Center(
                child: Column(
                  children: [
                    ///
                    ///
                    ///
                    ///
                    ///
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
                      controller: widget.emailcontroler,
                      style: GoogleFonts.lobster(
                          fontSize: 20,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    const SizedBox(
                      height: 1,
                    ),

                    ///
                    ///
                    ///
                    ///
                    ///
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
                      controller: widget.passwordcontroler,
                      style: GoogleFonts.lobster(
                          fontSize: 20,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    const SizedBox(
                      height: 1,
                    ),

                    ///
                    ///
                    ///
                    ///
                    ///
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () async {
                        if (isCreatingAccount == true) {
                          // REJESTRACJA
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: widget.emailcontroler.text,
                              password: widget.passwordcontroler.text,
                            );
                          } catch (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                            print(error);
                          }
                          ;
                        } else {
                          // LOGOWANIE
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: widget.emailcontroler.text,
                              password: widget.passwordcontroler.text,
                            );
                          } catch (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                            print(error);
                          }
                          ;
                        }
                      },
                      child: Text(
                        isCreatingAccount == true
                            ? 'Zarejestruj się'
                            : 'Zaloguj się',
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),

                    ///
                    ///
                    ///
                    ///
                    if (isCreatingAccount == false) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = true;
                          });
                        },
                        child: Text(
                          'Utwórz konto',
                          style: GoogleFonts.lobster(
                            fontSize: 15,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ],

                    ///
                    ///
                    ///
                    if (isCreatingAccount == true) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = false;
                          });
                        },
                        child: Text(
                          'Masz już konto?',
                          style: GoogleFonts.lobster(
                            fontSize: 15,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ],

                    ///
                    ///
                    ///
                    Text(
                      errorMessage,
                      style: GoogleFonts.lobster(
                        fontSize: 18,
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),

            ///
            ///
            ///
          ],
        )),
      ),
    );
  }
}
