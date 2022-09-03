import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/app/features/home/iot_devices/cubit/iot_devices_cubit.dart';

class IotDevices extends StatelessWidget {
  const IotDevices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => IotDevicesCubit()..start(),
        child: Center(child: BlocBuilder<IotDevicesCubit, IotDevicesState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Text('something went wrong: ${state.errorMessage}');
            }
            if (state.isLoading == true) {
              return const Center(child: CircularProgressIndicator());
            }

            final documents = state.documents;

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
        )));
  }
}
