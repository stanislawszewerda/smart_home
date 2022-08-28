import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IotDevices extends StatefulWidget {
  const IotDevices({
    Key? key,
  }) : super(key: key);

  @override
  State<IotDevices> createState() => _IotDevicesState();
}

class _IotDevicesState extends State<IotDevices> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('devices').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }

          final documents = snapshot.data!.docs;

          return Column(
            children: [
              for (final document in documents) ...[
                Text(document['name']),
                Text(document['portnumber'].toString()),
                Text(document['rules'].toString()),
                Text(document['type']),
                Text(document['value'].toString()),
              ],
              const Center(
                child: Text('Ten ekran wyswietla urzadzenia IoT'),
              )
            ],
          );
        },
      ),
    );
  }
}
