// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ServiceListRecord>> getServiceDistance(
  List<ServiceListRecord>? serviceList,
  LatLng? currentLocation,
) async {
  // Add your function code here!
  for (var i = 0; i < serviceList!.length; i++) {
    print(serviceList[i].location!.latitude);
  }
  return serviceList!;
}
