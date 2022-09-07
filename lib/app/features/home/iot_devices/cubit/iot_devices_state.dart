part of 'iot_devices_cubit.dart';

@immutable
class IotDevicesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const IotDevicesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}