import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'iot_devices_state.dart';

class IotDevicesCubit extends Cubit<IotDevicesState> {
  IotDevicesCubit()
      : super(const IotDevicesState(
            documents: [], errorMessage: '', isLoading: false));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    //Loading
    emit(
      const IotDevicesState(documents: [], errorMessage: '', isLoading: true),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('devices')
        .orderBy('portnumber')
        .snapshots()
        .listen((data) {
      emit(
        IotDevicesState(
            documents: data.docs, errorMessage: '', isLoading: false),
      );
    })
      ..onError((error) {
        emit(
          IotDevicesState(
              documents: const [],
              errorMessage: error.toString(),
              isLoading: true),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
