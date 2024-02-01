import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getHeigthByDivide(
  double? width,
  double? divide,
) {
  return width! / divide!;
}

String? getLocationLatLng(
  LatLng? location,
  String? type,
) {
  if (type == "lat") {
    return location!.latitude.toString();
  } else {
    return location!.longitude.toString();
  }
}

List<ServiceListRecord>? getFilterTitleInServiceList(
  String? keyword,
  List<ServiceListRecord>? serviceList,
) {
  return serviceList!.where((item) => item.title.contains(keyword!)).toList();
}

List<CategoryListRecord>? getFilterNameInCategoryList(
  String? keyword,
  List<CategoryListRecord>? categoryList,
) {
  return categoryList!.where((item) => item.name.contains(keyword!)).toList();
}

String? getBookingStatus(int? statusID) {
  for (var item in FFAppState().statusTypeList) {
    if (item.id == statusID) {
      return item.name;
    }
  }
  return '-';
}

String? getThaiDatetime(DateTime? date) {
  var newDateTime = dateTimeFormat("d MMM y HH:mm", date, locale: "TH_th");
  var tmpNewDate = newDateTime.split(" ");
  var newYear = int.parse(tmpNewDate[2]) + 543;
  return newDateTime =
      '${tmpNewDate[0]} ${tmpNewDate[1]} $newYear ${tmpNewDate[3]} น.';
}
