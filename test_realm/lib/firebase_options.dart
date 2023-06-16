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
    apiKey: 'AIzaSyCFaq7JZL2BWBv2ZKVinoHlQYGHadx0lC0',
    appId: '1:629582960373:web:c905de1cc8aad6ba0417bc',
    messagingSenderId: '629582960373',
    projectId: 'testrealm-abe08',
    authDomain: 'testrealm-abe08.firebaseapp.com',
    storageBucket: 'testrealm-abe08.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqxcWV28dSdhyRa2FC7TkO92KifSvic4s',
    appId: '1:629582960373:android:4565a02d89dcd8cd0417bc',
    messagingSenderId: '629582960373',
    projectId: 'testrealm-abe08',
    storageBucket: 'testrealm-abe08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA93GWfkFXYfW1lr2xRk07p6v_CK3zQwis',
    appId: '1:629582960373:ios:ccab978448c84e3d0417bc',
    messagingSenderId: '629582960373',
    projectId: 'testrealm-abe08',
    storageBucket: 'testrealm-abe08.appspot.com',
    iosClientId: '629582960373-q76h3nd7kemqe227a6fv15cmbkmg0iev.apps.googleusercontent.com',
    iosBundleId: 'com.example.testRealm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA93GWfkFXYfW1lr2xRk07p6v_CK3zQwis',
    appId: '1:629582960373:ios:ccab978448c84e3d0417bc',
    messagingSenderId: '629582960373',
    projectId: 'testrealm-abe08',
    storageBucket: 'testrealm-abe08.appspot.com',
    iosClientId: '629582960373-q76h3nd7kemqe227a6fv15cmbkmg0iev.apps.googleusercontent.com',
    iosBundleId: 'com.example.testRealm',
  );
}
