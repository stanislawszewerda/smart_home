import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/home/home_page.dart';

class AddIotDevice extends StatefulWidget {
  const AddIotDevice({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<AddIotDevice> createState() => _AddIotDeviceState();
}

class _AddIotDeviceState extends State<AddIotDevice> {
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
              },
              leading: const Icon(Icons.add),
              hoverColor: Colors.grey,
              title: const Text("Add IoT Device"),
            ),
            ListTile(
              onTap: () {
                // here is a place to create another screan for adding CCTV webcams
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

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => HomePage(user: widget.user)));
                });
              },
              leading: const Icon(Icons.home),
              hoverColor: Colors.grey,
              title: const Text("Home"),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              hoverColor: Colors.grey,
              title: const Text("Settings"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.shop),
              hoverColor: Colors.grey,
              title: const Text("Buy our devices"),
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('This screen will allow you to add new IoT Device')
        ],
      )),
    );
  }
}
