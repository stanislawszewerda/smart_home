import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'iot_devices_state.dart';

class IotDevicesCubit extends Cubit<IotDevicesState> {
  IotDevicesCubit() : super(IotDevicesState(documents: const []));
}
