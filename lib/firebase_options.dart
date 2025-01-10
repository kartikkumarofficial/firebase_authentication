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
    apiKey: 'AIzaSyDxP4hKdo4eiBxlM2J5UKwsBkteqcCaA18',
    appId: '1:361998355281:web:807e1d81b687ee0e47e170',
    messagingSenderId: '361998355281',
    projectId: 'authentication-2d063',
    authDomain: 'authentication-2d063.firebaseapp.com',
    storageBucket: 'authentication-2d063.firebasestorage.app',
    measurementId: 'G-T383T5DNRT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgOx4TcFh9A5mQAXAEw50Ox8OVHYG9JB0',
    appId: '1:361998355281:android:1dbc252a7484605e47e170',
    messagingSenderId: '361998355281',
    projectId: 'authentication-2d063',
    storageBucket: 'authentication-2d063.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHQj404t7Ivxewgdn5RjBmh-0t7_lZz0s',
    appId: '1:361998355281:ios:c1559744fef893f547e170',
    messagingSenderId: '361998355281',
    projectId: 'authentication-2d063',
    storageBucket: 'authentication-2d063.firebasestorage.app',
    iosBundleId: 'com.example.firebaseAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHQj404t7Ivxewgdn5RjBmh-0t7_lZz0s',
    appId: '1:361998355281:ios:c1559744fef893f547e170',
    messagingSenderId: '361998355281',
    projectId: 'authentication-2d063',
    storageBucket: 'authentication-2d063.firebasestorage.app',
    iosBundleId: 'com.example.firebaseAuthentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxP4hKdo4eiBxlM2J5UKwsBkteqcCaA18',
    appId: '1:361998355281:web:4512ae3ff46e011547e170',
    messagingSenderId: '361998355281',
    projectId: 'authentication-2d063',
    authDomain: 'authentication-2d063.firebaseapp.com',
    storageBucket: 'authentication-2d063.firebasestorage.app',
    measurementId: 'G-190EFS56F4',
  );
}
