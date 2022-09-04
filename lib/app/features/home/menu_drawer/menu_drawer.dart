import 'package:flutter/material.dart';
import 'package:smart_home/app/features/addcctvwebcam/add_cctv_webcam_page.dart';
import 'package:smart_home/app/features/addiotdevice/add_iot_device_page.dart';
import 'package:smart_home/app/features/home/home_page.dart';
import 'package:smart_home/app/features/settings/settings_page.dart';
import 'package:smart_home/app/features/shop/shop_page.dart';

// Drawer najprawdopodobniej nada się do wyekstraktowania jako osobny widget bo zajmie dużo miejsca!!!!!!
/// Pomysły do zrobienia:
/// Trzeba sprobować dodać Drawer jako osoby widget który będzie można wstawić na dowolnej stronie!!!
/// Rozwijane menu Home? Po rozwinieciu przechodzimy do home a następnie z rozsuniętego home wybieramy to samo co z appbara?

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

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
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AddIotDevicePage()));
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
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AddCctvWebcamPage()));
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
            leading: const Icon(Icons.settings),
            hoverColor: Colors.grey,
            title: const Text("Settings"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ShopPage()));
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
