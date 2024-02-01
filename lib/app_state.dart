import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
  set test(String _value) {
    _test = _value;
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? _value) {
    _currentLocation = _value;
  }

  bool _hasNearService = true;
  bool get hasNearService => _hasNearService;
  set hasNearService(bool _value) {
    _hasNearService = _value;
  }

  List<StatusTypeStruct> _statusTypeList = [];
  List<StatusTypeStruct> get statusTypeList => _statusTypeList;
  set statusTypeList(List<StatusTypeStruct> _value) {
    _statusTypeList = _value;
  }

  void addToStatusTypeList(StatusTypeStruct _value) {
    _statusTypeList.add(_value);
  }

  void removeFromStatusTypeList(StatusTypeStruct _value) {
    _statusTypeList.remove(_value);
  }

  void removeAtIndexFromStatusTypeList(int _index) {
    _statusTypeList.removeAt(_index);
  }

  void updateStatusTypeListAtIndex(
    int _index,
    StatusTypeStruct Function(StatusTypeStruct) updateFn,
  ) {
    _statusTypeList[_index] = updateFn(_statusTypeList[_index]);
  }

  void insertAtIndexInStatusTypeList(int _index, StatusTypeStruct _value) {
    _statusTypeList.insert(_index, _value);
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
