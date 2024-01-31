// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

Future<List<ServiceListRecord>> getServiceDistance(
  List<ServiceListRecord>? serviceList,
  LatLng? currentLocation,
) async {
  // Add your function code here!
  var apiKey = "AIzaSyCvb-Gf-CpXqAmywyKIMArC3W8pBOrL3og";
  var origin = "${currentLocation!.latitude},${currentLocation.longitude}";
  for (var i = 0; i < serviceList!.length; i++) {
    var destination =
        "${serviceList[i].location!.latitude},${serviceList[i].location!.longitude}";
    var url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey";
    var response = await http.post(Uri.parse(url));
    var data = jsonDecode(response.body);
    Map<String, dynamic> distance;
    distance = {
      "text": '-',
      "distance": 0,
    };

    if (response.statusCode == 200) {
      try {
        if (data["routes"][0]["legs"][0]["distance"]["text"]
            .toString()
            .contains("km")) {
          distance["text"] = data["routes"][0]["legs"][0]["distance"]["text"]
              .toString()
              .replaceAll("km", "กม.");
          distance["distance"] =
              data["routes"][0]["legs"][0]["distance"]["value"];
        } else if (data["routes"][0]["legs"][0]["distance"]["text"]
            .toString()
            .contains("m")) {
          distance["text"] = data["routes"][0]["legs"][0]["distance"]["text"]
              .toString()
              .replaceAll("m", "ม.");
          distance["distance"] =
              data["routes"][0]["legs"][0]["distance"]["value"];
        }
      } catch (e) {
        print("eroooor : $e");
      }
    }
    serviceList[i].distanceText = distance["text"];
    serviceList[i].distanceValue = distance["distance"];
  }
  serviceList.sort((a, b) => a.distanceValue.compareTo(b.distanceValue));
  if (serviceList.isNotEmpty) {
    if (serviceList[0].distanceValue > 100000) {
      FFAppState().hasNearService = false;
    }
  }
  return serviceList;
}
