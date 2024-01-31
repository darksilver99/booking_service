import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBJOCiLTju_JrCfV7tZoAq_WXv_MU_QNIs",
            authDomain: "booking-service-8oymdg.firebaseapp.com",
            projectId: "booking-service-8oymdg",
            storageBucket: "booking-service-8oymdg.appspot.com",
            messagingSenderId: "811447320818",
            appId: "1:811447320818:web:4be2f396e0dc10d883d06b"));
  } else {
    await Firebase.initializeApp();
  }
}
