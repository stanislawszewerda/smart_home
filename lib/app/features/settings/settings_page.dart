import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/features/home/menu_drawer/menu_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text('Smart Home', style: GoogleFonts.lobster(fontSize: 30)),
              Text('Just for you', style: GoogleFonts.lobster(fontSize: 10)),
            ],
          ),
        ),
        // Drawer najprawdopodobniej nada się do wyekstraktowania jako osobny widget bo zajmie dużo miejsca!!!!!!
        /// Pomysły do zrobienia:
        /// Trzeba sprobować dodać Drawer jako osoby widget który będzie można wstawić na dowolnej stronie!!!
        /// Rozwijane menu Home? Po rozwinieciu przechodzimy do home a następnie z rozsuniętego home wybieramy to samo co z appbara?
        drawer: const MenuDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Settings Page', style: GoogleFonts.lobster()),
            Text('This functionality will be avaliable in the future',
                style: GoogleFonts.lobster())
          ]),
        ));
  }
}
