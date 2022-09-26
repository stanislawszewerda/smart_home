part of 'iot_devices_cubit.dart';

@immutable
class IotDevicesState {
  const IotDevicesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  //final List<ItemModel> documents;
  final bool isLoading;
  final String errorMessage;
}
