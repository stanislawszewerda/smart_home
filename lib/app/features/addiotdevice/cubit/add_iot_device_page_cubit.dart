import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_iot_device_page_state.dart';

class AddIotDevicePageCubit extends Cubit<AddIotDevicePageState> {
  AddIotDevicePageCubit() : super(const AddIotDevicePageState());

  Future<void> add(
    int portNumber,
    String iotDeviceName,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('devices').add(
        {
          'portnumber': portNumber,
          'name': iotDeviceName,
        },
      );

      emit(const AddIotDevicePageState(saved: true));
    } catch (error) {
      emit(AddIotDevicePageState(errorMessage: error.toString()));
    }
  }
}
