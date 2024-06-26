// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyAilLWkqESC0s2RRs0q7yNs4Y7PLc0j6C8",
      authDomain: "desarrollomobile-b195d.firebaseapp.com",
      projectId: "desarrollomobile-b195d",
      storageBucket: "desarrollomobile-b195d.appspot.com",
      messagingSenderId: "904260307344",
      appId: "1:904260307344:web:79e03a1c2b07c0a5770b15",
      measurementId: "G-CT9J19VWZ9");

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAilLWkqESC0s2RRs0q7yNs4Y7PLc0j6C8",
      authDomain: "desarrollomobile-b195d.firebaseapp.com",
      projectId: "desarrollomobile-b195d",
      storageBucket: "desarrollomobile-b195d.appspot.com",
      messagingSenderId: "904260307344",
      appId: "1:904260307344:web:79e03a1c2b07c0a5770b15",
      measurementId: "G-CT9J19VWZ9");

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyAilLWkqESC0s2RRs0q7yNs4Y7PLc0j6C8",
    authDomain: "desarrollomobile-b195d.firebaseapp.com",
    projectId: "desarrollomobile-b195d",
    storageBucket: "desarrollomobile-b195d.appspot.com",
    messagingSenderId: "904260307344",
    appId: "1:904260307344:web:79e03a1c2b07c0a5770b15",
    measurementId: "G-CT9J19VWZ9",
    iosBundleId: 'com.example.desarrolloMovilApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyAilLWkqESC0s2RRs0q7yNs4Y7PLc0j6C8",
    authDomain: "desarrollomobile-b195d.firebaseapp.com",
    projectId: "desarrollomobile-b195d",
    storageBucket: "desarrollomobile-b195d.appspot.com",
    messagingSenderId: "904260307344",
    appId: "1:904260307344:web:79e03a1c2b07c0a5770b15",
    measurementId: "G-CT9J19VWZ9",
    iosBundleId: 'com.example.desarrolloMovilApp.RunnerTests',
  );
}
