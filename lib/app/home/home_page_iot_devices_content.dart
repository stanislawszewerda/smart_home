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
            child: const Text(
                'Ten Container ma zawiercać urządzenie IoT oraz stan jego załączenia'),
          ),
        ],
      ),
    );
  }
}
