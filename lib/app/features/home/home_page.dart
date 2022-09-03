import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smart_home/app/features/home/cctv_webcams/home_page_cctv_content.dart';
import 'package:smart_home/app/features/home/iot_devices/home_page_iot_devices_content.dart';
import 'package:smart_home/app/features/home/my_account/home_page_my_account_page_content.dart';
import 'package:smart_home/app/features/home/menu_drawer/menu_drawer.dart';

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
      drawer: MenuDrawer(user: widget.user),

      ///
      body: Builder(
        builder: (context) {
          if (currentIndex == 2) {
            return MyAccount(user: widget.user);
          }
          if (currentIndex == 1) {
            return const Cctv();
          }
          if (currentIndex == 0) {}

          return const IotDevices();
        },
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'CCTV'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Account'),
        ],
      ),
    );
  }
}
