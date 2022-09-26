import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/models/item_model.dart';

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
      final itemModels = data.docs.map((doc) {
        return ItemModel(
            portNumber: doc['portNumber'],
            iotDeviceName: doc['name'],
            iotType: doc['iotType'],
            state: doc['state']);
      }).toList();

      emit(
        IotDevicesState(
            documents: itemModels, errorMessage: '', isLoading: false),
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
