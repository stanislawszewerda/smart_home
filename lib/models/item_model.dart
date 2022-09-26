class ItemModel {
  ItemModel(
      {required this.portNumber,
      required this.iotDeviceName,
      required this.iotType,
      required this.state});

  final int portNumber;
  final String iotDeviceName;
  final String iotType;
  final bool state;
}
