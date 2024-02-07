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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appBuildVersion = prefs.getInt('ff_appBuildVersion') ?? _appBuildVersion;
    });
    _safeInit(() {
      _isTesting = prefs.getBool('ff_isTesting') ?? _isTesting;
    });
    _safeInit(() {
      _androidStoreLink =
          prefs.getString('ff_androidStoreLink') ?? _androidStoreLink;
    });
    _safeInit(() {
      _iosStoreLink = prefs.getString('ff_iosStoreLink') ?? _iosStoreLink;
    });
    _safeInit(() {
      _isEnableAd = prefs.getBool('ff_isEnableAd') ?? _isEnableAd;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String _value) {
    _appVersion = _value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int _value) {
    _appBuildVersion = _value;
    prefs.setInt('ff_appBuildVersion', _value);
  }

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  set isTesting(bool _value) {
    _isTesting = _value;
    prefs.setBool('ff_isTesting', _value);
  }

  String _androidStoreLink = '';
  String get androidStoreLink => _androidStoreLink;
  set androidStoreLink(String _value) {
    _androidStoreLink = _value;
    prefs.setString('ff_androidStoreLink', _value);
  }

  String _iosStoreLink = '';
  String get iosStoreLink => _iosStoreLink;
  set iosStoreLink(String _value) {
    _iosStoreLink = _value;
    prefs.setString('ff_iosStoreLink', _value);
  }

  int _storeBuildVersion = 0;
  int get storeBuildVersion => _storeBuildVersion;
  set storeBuildVersion(int _value) {
    _storeBuildVersion = _value;
  }

  bool _isEnableAd = false;
  bool get isEnableAd => _isEnableAd;
  set isEnableAd(bool _value) {
    _isEnableAd = _value;
    prefs.setBool('ff_isEnableAd', _value);
  }

  int _price = 0;
  int get price => _price;
  set price(int _value) {
    _price = _value;
  }

  int _fullPrice = 0;
  int get fullPrice => _fullPrice;
  set fullPrice(int _value) {
    _fullPrice = _value;
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
