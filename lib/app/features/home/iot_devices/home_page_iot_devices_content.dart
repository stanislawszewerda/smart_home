import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/app/features/home/iot_devices/cubit/iot_devices_cubit.dart';
import 'package:smart_home/models/item_model.dart';

class IotDevices extends StatefulWidget {
  const IotDevices({
    Key? key,
  }) : super(key: key);

  @override
  State<IotDevices> createState() => _IotDevicesState();
}

class _IotDevicesState extends State<IotDevices> {
  bool value = true;

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

            //we have to do something here :/

            final itemModels = state.documents;

            return ListView(
              children: [
                for (final itemModel in itemModels) ...[
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
                                itemModel.iotDeviceName,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(153, 0, 0, 0),
                            ),
                            child: buildSwitch(),
                          ),
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(153, 0, 0, 0),
                            ),
                            child: const Text(
                              'Żarówka',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(153, 0, 0, 0),
                            ),
                            child: Text(
                              itemModel.portNumber.toString(),
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

  Widget buildSwitch() => Switch.adaptive(
      activeColor: Colors.greenAccent,
      inactiveThumbColor: Colors.redAccent,
      inactiveTrackColor: const Color.fromARGB(132, 196, 56, 56),
      value: value,
      onChanged: (value) => setState(() => this.value = value));
}
