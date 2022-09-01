part of 'iot_devices_cubit.dart';

@immutable
class IotDevicesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  IotDevicesState({required this.documents});
}
