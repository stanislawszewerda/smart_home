import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'iot_devices_state.dart';

class IotDevicesCubit extends Cubit<IotDevicesState> {
  IotDevicesCubit()
      : super(const IotDevicesState(
            documents: [], errorMessage: '', isLoading: false));

  Future<void> start() async {
    emit(
      const IotDevicesState(documents: [], errorMessage: '', isLoading: true),
    );
    await Future.delayed(const Duration(seconds: 5));
    emit(
      const IotDevicesState(
          documents: [], errorMessage: 'Błąd połącznia', isLoading: false),
    );
  }
}
