import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/cubit/root_cubit.dart';
import 'package:smart_home/app/features/welcome/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({
    Key? key,
    //required this.user,
  }) : super(key: key);

  //final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Jesteś zalogowany jako:',
            style: GoogleFonts.lobster(fontSize: 20),
          ),
          const SizedBox(height: 50),
          /*Text(
            '${user.email}',
            style: GoogleFonts.lobster(fontSize: 20),
          ),
          */
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(70, 35, 241, 104)),
            onPressed: () {
              context.read<RootCubit>().signOut();
              /*
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false);
                  */
            },
            child: Text(
              'Wyloguj się',
              style: GoogleFonts.lobster(
                fontSize: 20,
                textStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const WelcomePage()));
            },
            child: Text(
              'Zobacz ekran powitalny',
              style: GoogleFonts.lobster(
                fontSize: 20,
                textStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
