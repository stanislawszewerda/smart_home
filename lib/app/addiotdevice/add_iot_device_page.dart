import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/home/menu_drawer.dart';

class AddIotDevicePage extends StatefulWidget {
  const AddIotDevicePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<AddIotDevicePage> createState() => _AddIotDevicePageState();
}

class _AddIotDevicePageState extends State<AddIotDevicePage> {
  var currentIndex = 0;

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
      // Drawer najprawdopodobniej nada się do wyekstraktowania jako osobny widget bo zajmie dużo miejsca
      /// Drawer dodany na tej stronie trzeba koniecznie usunąć i dodać widget utworzony z drawera
      /// zrobionego w home page
      drawer: MenuDrawer(user: widget.user),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('This screen will allow you to add new IoT Device')
          ],
        ),
      ),
    );
  }
}
