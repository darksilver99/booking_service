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

Future setStatusType(List<BookingStatusRecord>? statusList) async {
  // Add your function code here!
  FFAppState().statusTypeList = statusList!
      .map((item) => StatusTypeStruct(
            id: item.id,
            name: item.name,
          ))
      .toList();
}
