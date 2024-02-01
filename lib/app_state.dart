import 'package:flutter/material.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _test = '';
  String get test => _test;
  set test(String value) {
    _test = value;
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? value) {
    _currentLocation = value;
  }

  bool _hasNearService = true;
  bool get hasNearService => _hasNearService;
  set hasNearService(bool value) {
    _hasNearService = value;
  }

  List<StatusTypeStruct> _statusTypeList = [];
  List<StatusTypeStruct> get statusTypeList => _statusTypeList;
  set statusTypeList(List<StatusTypeStruct> value) {
    _statusTypeList = value;
  }

  void addToStatusTypeList(StatusTypeStruct value) {
    _statusTypeList.add(value);
  }

  void removeFromStatusTypeList(StatusTypeStruct value) {
    _statusTypeList.remove(value);
  }

  void removeAtIndexFromStatusTypeList(int index) {
    _statusTypeList.removeAt(index);
  }

  void updateStatusTypeListAtIndex(
    int index,
    StatusTypeStruct Function(StatusTypeStruct) updateFn,
  ) {
    _statusTypeList[index] = updateFn(_statusTypeList[index]);
  }

  void insertAtIndexInStatusTypeList(int index, StatusTypeStruct value) {
    _statusTypeList.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
