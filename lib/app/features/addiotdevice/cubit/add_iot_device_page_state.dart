part of 'add_iot_device_page_cubit.dart';

@immutable
class AddIotDevicePageState {
  const AddIotDevicePageState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
