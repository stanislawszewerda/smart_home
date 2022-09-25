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
                for (final document in documents) ...[
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(61, 85, 255, 7)),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(153, 0, 0, 0),
                            ),
                            child: Center(
                              child: Text(
                                document['name'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(153, 0, 0, 0),
                            ),
                            child: Text(
                              document['portnumber'].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                  ),
                ],
              ],
            );
          },
        )));
  }
}
