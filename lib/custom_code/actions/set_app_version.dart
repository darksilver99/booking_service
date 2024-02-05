// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:package_info_plus/package_info_plus.dart';

Future setAppVersion() async {
  // Add your function code here!
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: '',
    buildNumber: '',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  final info = await PackageInfo.fromPlatform();
  _packageInfo = info;
  var rs = await FirebaseFirestore.instance.doc("config/data").get();
  FFAppState().update(() {
    FFAppState().appVersion =
        'Ver ${_packageInfo.version} (${_packageInfo.buildNumber})';
    FFAppState().storeBuildVersion = rs.data()!["store_version"];
    FFAppState().appBuildVersion = int.parse(_packageInfo.buildNumber);
    FFAppState().androidStoreLink = rs.data()!["android_store_link"];
    FFAppState().iosStoreLink = rs.data()!["ios_store_link"];
    FFAppState().isEnableAd = rs.data()!["enable_ad"];
    FFAppState().isTesting = rs.data()!["is_testing"];
  });
}
