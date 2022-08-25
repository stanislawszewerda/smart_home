import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/welcome/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

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
      body: Builder(builder: (context) {
        if (currentIndex == 1) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Jesteś zalogowany jako:',
                  style: GoogleFonts.lobster(fontSize: 20),
                ),
                const SizedBox(height: 50),
                Text(
                  '${widget.user.email}',
                  style: GoogleFonts.lobster(fontSize: 20),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(70, 35, 241, 104)),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    'Wyloguj się',
                    style: GoogleFonts.lobster(
                      fontSize: 20,
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(70, 35, 241, 104)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const WelcomePage()));
                  },
                  child: Text(
                    'Zobacz ekran powitalny',
                    style: GoogleFonts.lobster(
                      fontSize: 20,
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        ///
        ///
        ///
        ///
        ///
        return Center(
          child: ListView(
            children: [
              Container(
                color: const Color.fromARGB(69, 35, 241, 104),
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                    'Ten Container ma zawiercać urządzenie IoT oraz stan jego załączenia'),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.device_hub), label: 'IoT Devices'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account')
        ],
      ),
    );
  }
}
