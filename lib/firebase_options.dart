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
    apiKey: 'AIzaSyA-klvAJbjxYiaAKHKsRhemPnepf8WQGG8',
    appId: '1:546427274598:web:f3b60cf4afa6f4bd1cf4a7',
    messagingSenderId: '546427274598',
    projectId: 'appdulich-354609',
    authDomain: 'appdulich-354609.firebaseapp.com',
    storageBucket: 'appdulich-354609.appspot.com',
    measurementId: 'G-ZG2XYJQCEF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCy6LgLL9ox0ito2d9nNIeyDiobhFBLjpk',
    appId: '1:546427274598:android:631fb16abad0f0df1cf4a7',
    messagingSenderId: '546427274598',
    projectId: 'appdulich-354609',
    storageBucket: 'appdulich-354609.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSRA29E1TLJj_VxZeIo8H9nb3ru7Fl6LM',
    appId: '1:546427274598:ios:88b94908907aa2cb1cf4a7',
    messagingSenderId: '546427274598',
    projectId: 'appdulich-354609',
    storageBucket: 'appdulich-354609.appspot.com',
    androidClientId:
        '546427274598-bho0ltkkpccbjcbpqqv192im8dq6hhmr.apps.googleusercontent.com',
    iosClientId:
        '546427274598-ka9kq8leaoc3n48v45c13nrj3f7vurlk.apps.googleusercontent.com',
    iosBundleId: 'com.chaudu.bankblood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSRA29E1TLJj_VxZeIo8H9nb3ru7Fl6LM',
    appId: '1:546427274598:ios:8fedbf5f484cb6281cf4a7',
    messagingSenderId: '546427274598',
    projectId: 'appdulich-354609',
    storageBucket: 'appdulich-354609.appspot.com',
    androidClientId:
        '546427274598-bho0ltkkpccbjcbpqqv192im8dq6hhmr.apps.googleusercontent.com',
    iosClientId:
        '546427274598-g0aagqisbqnnb4p5b0mfib990gl6ndkp.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}