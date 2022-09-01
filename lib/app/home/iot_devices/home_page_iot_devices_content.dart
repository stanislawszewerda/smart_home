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
        stream: FirebaseFirestore.instance
            .collection('devices')
            .orderBy('portnumber')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 152, 163, 0)),
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Device name'),
                    Text('Port number'),
                    Text('State'),
                    Text('Button'),
                  ],
                ),
              ),
              for (final document in documents) ...[
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(61, 85, 255, 7)),
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(20.20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(document['name']),
                        Text(document['portnumber'].toString()),
                        const Text('value'),
                        const Text('button'),
                      ]),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
