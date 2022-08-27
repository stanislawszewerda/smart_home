import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/app/addcctvwebcam/add_cctv_webcam_page.dart';
import 'package:smart_home/app/addiotdevice/add_iot_device_page.dart';
import 'package:smart_home/app/home/home_page.dart';
import 'package:smart_home/app/settings/settings_page.dart';
import 'package:smart_home/app/shop/shop_page.dart';

// Drawer najprawdopodobniej nada się do wyekstraktowania jako osobny widget bo zajmie dużo miejsca!!!!!!
/// Pomysły do zrobienia:
/// Trzeba sprobować dodać Drawer jako osoby widget który będzie można wstawić na dowolnej stronie!!!
/// Rozwijane menu Home? Po rozwinieciu przechodzimy do home a następnie z rozsuniętego home wybieramy to samo co z appbara?

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              /// Wybranie strony z menu powoduje zamkniecie wszystkich otwartych ekranow
              /// Następnie otwiera się ekran HomePage
              /// Użycie przycisku cofnij nie wyrzuca użytkownika z aplkikacji tylko zawsze wrzuca spowrotem na strone HomePage
              /// Rozwiazany problem nadmiernego nakładania się
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => HomePage(user: widget.user)),
                  (Route<dynamic> route) => false);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddCctvWebcamPage(user: widget.user)));
            },
            leading: const Icon(Icons.add),
            hoverColor: Colors.grey,
            title: const Text("Add CCTV webcam"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => HomePage(user: widget.user)),
                  (Route<dynamic> route) => false);
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
                      builder: (context) => SettingsPage(
                            user: widget.user,
                          )),
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
                  MaterialPageRoute(
                      builder: (context) => ShopPage(user: widget.user)),
                  (Route<dynamic> route) => false);
            },
            leading: const Icon(Icons.shop),
            hoverColor: Colors.grey,
            title: const Text("Buy our devices"),
          ),
        ],
      ),
    );
  }
}
