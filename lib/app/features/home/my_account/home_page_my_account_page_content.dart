import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/cubit/root_cubit.dart';
import 'package:smart_home/app/features/welcome/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

String? user;

class _MyAccountState extends State<MyAccount> {
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
          BlocProvider(
              create: (context) => RootCubit()..start(),
              child: Center(child:
                  BlocBuilder<RootCubit, RootState>(builder: (context, state) {
                final user = state.user?.email;
                return Center(child: Text(user.toString()));
              }))),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(70, 35, 241, 104)),
            onPressed: () {
              context.read<RootCubit>().signOut();
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
