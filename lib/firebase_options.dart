// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD3F3lUk8qyqMCvV27WaiHltFtoIyu0USA',
    appId: '1:306492857384:web:0092b0c4ae9642cc5fa91d',
    messagingSenderId: '306492857384',
    projectId: 'solemate-59986',
    authDomain: 'solemate-59986.firebaseapp.com',
    storageBucket: 'solemate-59986.firebasestorage.app',
    measurementId: 'G-6P07MDTPVD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRoFgStir_eEU95tP99e8nWVIdV2_053Q',
    appId: '1:306492857384:android:1dffd759a29f56045fa91d',
    messagingSenderId: '306492857384',
    projectId: 'solemate-59986',
    storageBucket: 'solemate-59986.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4GYgM0WMgdaP0QlS9MhVdR6tDmx0EOoY',
    appId: '1:306492857384:ios:33fa77b457033cc45fa91d',
    messagingSenderId: '306492857384',
    projectId: 'solemate-59986',
    storageBucket: 'solemate-59986.firebasestorage.app',
    iosBundleId: 'com.example.solemate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4GYgM0WMgdaP0QlS9MhVdR6tDmx0EOoY',
    appId: '1:306492857384:ios:33fa77b457033cc45fa91d',
    messagingSenderId: '306492857384',
    projectId: 'solemate-59986',
    storageBucket: 'solemate-59986.firebasestorage.app',
    iosBundleId: 'com.example.solemate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD3F3lUk8qyqMCvV27WaiHltFtoIyu0USA',
    appId: '1:306492857384:web:f8a3fc41fd75f8675fa91d',
    messagingSenderId: '306492857384',
    projectId: 'solemate-59986',
    authDomain: 'solemate-59986.firebaseapp.com',
    storageBucket: 'solemate-59986.firebasestorage.app',
    measurementId: 'G-88MQND15ZT',
  );
}
