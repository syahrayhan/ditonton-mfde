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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBfde4Ux31HXXi-Qlt7rs4m777YWNlQ9LA',
    appId: '1:528982270295:web:6e689fedb6043fa102de12',
    messagingSenderId: '528982270295',
    projectId: 'ditonton-3f0a1',
    authDomain: 'ditonton-3f0a1.firebaseapp.com',
    storageBucket: 'ditonton-3f0a1.appspot.com',
    measurementId: 'G-KNKGBV0EV1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_4vP74Y7yLJOLkbZwICfi3nMYxM-TvwQ',
    appId: '1:528982270295:android:afed6bdac27d627e02de12',
    messagingSenderId: '528982270295',
    projectId: 'ditonton-3f0a1',
    storageBucket: 'ditonton-3f0a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAT6RHP8m5YsnTUEpeh6AQcL5JskCM4iXQ',
    appId: '1:528982270295:ios:1c937566dd38026702de12',
    messagingSenderId: '528982270295',
    projectId: 'ditonton-3f0a1',
    storageBucket: 'ditonton-3f0a1.appspot.com',
    iosClientId: '528982270295-bdjrulbahis3q5nh1argvvjao37rghb3.apps.googleusercontent.com',
    iosBundleId: 'com.dicoding.ditonton',
  );
}
