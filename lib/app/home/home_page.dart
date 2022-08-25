import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/home/home_page_iot_devices_content.dart';
import 'package:smart_home/app/home/home_page_my_account_page_content.dart';

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
      ),
      // Drawer najprawdopodobniej nada się do wyekstraktowania jako osobny widget bo zajmie dużo miejsca
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: const Icon(Icons.menu),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Text('Add new IoT Device'),
          const Text('Element2'),
          const Text('Element3'),
        ],
      )),

      ///
      body: Builder(
        builder: (context) {
          if (currentIndex == 1) {
            return MyAccount(widget: widget);
          }

          ///
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account')
        ],
      ),
    );
  }
}
