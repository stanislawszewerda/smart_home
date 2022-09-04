import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/app/features/home/home_page.dart';
import 'package:smart_home/app/features/home/menu_drawer/menu_drawer.dart';
import 'package:numberpicker/numberpicker.dart';

class AddIotDevicePage extends StatefulWidget {
  const AddIotDevicePage({
    Key? key,
    //required this.user,
  }) : super(key: key);

  //final User user;

  @override
  State<AddIotDevicePage> createState() => _AddIotDevicePageState();
}

class _AddIotDevicePageState extends State<AddIotDevicePage> {
  var portNumber = 1;
  var iotDeviceName = '';

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
      drawer: const MenuDrawer(),
      body: Center(
        child: ListView(
          children: [
            Container(
              color: const Color.fromARGB(69, 35, 241, 104),
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  NumberPicker(
                    axis: Axis.horizontal,
                    value: portNumber,
                    minValue: 1,
                    maxValue: 10,
                    onChanged: (value) => setState(() => portNumber = value),
                  ),
                  const Text('Set number of the port on Master Device'),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(69, 35, 241, 104),
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text('Name your device'),
                  const Text('(for example: light in the kitchen)'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      focusColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(),
                      label: Center(child: Text('Name of device')),
                    ),
                    onChanged: ((newValue) {
                      iotDeviceName = newValue;
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color.fromARGB(0, 35, 241, 104),
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: iotDeviceName.isEmpty
                          ? null
                          : () {
                              FirebaseFirestore.instance
                                  .collection('devices')
                                  .add({
                                'portnumber': portNumber,
                                'name': iotDeviceName,
                              });
                              Navigator.of(context).pop();

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                  (Route<dynamic> route) => false);
                            },
                      child: const Text('Add Device')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
