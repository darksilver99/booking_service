import 'dart:io';

import 'package:booking_service/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future subscribeToTopic() async {
  var userID = currentUserReference!.id;
  await FirebaseMessaging.instance.subscribeToTopic(userID);
  var platForm = Platform.isIOS ? "ios" : "android";
  await FirebaseMessaging.instance.subscribeToTopic(platForm);
  await FirebaseMessaging.instance.subscribeToTopic("booking_service");
}

Future upSubscribeTopic() async {
  FirebaseMessaging.instance.deleteToken();
}
