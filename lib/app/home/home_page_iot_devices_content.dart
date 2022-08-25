import 'package:flutter/material.dart';

class IotDevices extends StatelessWidget {
  const IotDevices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Container(
            color: const Color.fromARGB(69, 35, 241, 104),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                Text('Urzadzenie IoT'),
                SizedBox(
                  width: 80,
                ),
                Text('Ikona stanu'),
              ],
            ),
          ),
          FloatingActionButton(
              onPressed: () {
                // Ten przycisk chwilowo będzie odpowiedzialny za dodawanie kolejnych containerow IoT
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
