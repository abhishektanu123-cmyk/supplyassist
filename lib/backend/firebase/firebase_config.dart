import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAU3IuCg7isttj4-sYb7cHvLJDAIM90kFg",
            authDomain: "supply-risk-app.firebaseapp.com",
            projectId: "supply-risk-app",
            storageBucket: "supply-risk-app.firebasestorage.app",
            messagingSenderId: "593648980136",
            appId: "1:593648980136:web:a3f1858c79be2ef9c4329d"));
  } else {
    await Firebase.initializeApp();
  }
}
