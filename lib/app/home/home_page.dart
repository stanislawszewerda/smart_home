import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/addcctvwebcam/add_cctv_webcam_page.dart';
import 'package:smart_home/app/addiotdevice/add_iot_device_page.dart';
import 'package:smart_home/app/home/home_page_cctv_content.dart';
import 'package:smart_home/app/home/home_page_iot_devices_content.dart';
import 'package:smart_home/app/home/home_page_my_account_page_content.dart';
import 'package:smart_home/app/settings/settings_page.dart';
import 'package:smart_home/app/shop/shop_page.dart';

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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              tileColor: const Color.fromARGB(90, 70, 247, 76),
              leading: const Icon(Icons.menu),
              title: const Text('Menu'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AddIotDevicePage(user: widget.user)));
              },
              leading: const Icon(Icons.add),
              hoverColor: Colors.grey,
              title: const Text("Add IoT Device"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AddCctvWebcamPage()));
              },
              leading: const Icon(Icons.add),
              hoverColor: Colors.grey,
              title: const Text("Add CCTV webcam"),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => HomePage(user: widget.user)),
                      (Route<dynamic> route) => false);
                });
              },
              leading: const Icon(Icons.home),
              hoverColor: Colors.grey,
              title: const Text("Home"),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                    (Route<dynamic> route) => false);
              },
              leading: const Icon(Icons.settings),
              hoverColor: Colors.grey,
              title: const Text("Settings"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const ShopPage()),
                    (Route<dynamic> route) => false);
              },
              leading: const Icon(Icons.shop),
              hoverColor: Colors.grey,
              title: const Text("Buy our devices"),
            ),
          ],
        ),
      ),

      ///
      body: Builder(
        builder: (context) {
          if (currentIndex == 2) {
            return MyAccount(user: widget.user);
          }
          if (currentIndex == 1) {
            return const Cctv();
          }

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
