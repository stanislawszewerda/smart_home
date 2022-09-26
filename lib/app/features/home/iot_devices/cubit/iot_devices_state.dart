part of 'iot_devices_cubit.dart';

@immutable
class IotDevicesState {
  const IotDevicesState({
    this.documents = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;
}
