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

Future updateAverateRating(DocumentReference? serviceRef) async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance
      .collection("review_list")
      .where("service_ref", isEqualTo: serviceRef)
      .where("status", isEqualTo: 1)
      .get();
  double totalStar = 0;
  for (var i = 0; i < rs.size; i++) {
    totalStar = totalStar + rs.docs[i].data()["star"];
  }
  double avg = totalStar / rs.size;
  serviceRef!.update({"rating": avg});
}
