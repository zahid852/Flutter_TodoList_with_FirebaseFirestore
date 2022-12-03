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
    apiKey: 'AIzaSyBbqlcIAeCi923ZgNUG70Pzl2hM8_VpJR8',
    appId: '1:958274747173:web:635c2505d20692a3eab8cc',
    messagingSenderId: '958274747173',
    projectId: 'todolist-f5821',
    authDomain: 'todolist-f5821.firebaseapp.com',
    storageBucket: 'todolist-f5821.appspot.com',
    measurementId: 'G-N9F3PWETGF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGy1MO4uM8q3XFs52N5fZh_pvLL3uq_y8',
    appId: '1:958274747173:android:2c53d2466e01ad09eab8cc',
    messagingSenderId: '958274747173',
    projectId: 'todolist-f5821',
    storageBucket: 'todolist-f5821.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWA71ulbx_mUV8I6o7qBW8w7I2RwwqJcE',
    appId: '1:958274747173:ios:4048885b2f4ef229eab8cc',
    messagingSenderId: '958274747173',
    projectId: 'todolist-f5821',
    storageBucket: 'todolist-f5821.appspot.com',
    iosClientId: '958274747173-u8oplqld54m9d2sru0bhuv14217e92ur.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWA71ulbx_mUV8I6o7qBW8w7I2RwwqJcE',
    appId: '1:958274747173:ios:4048885b2f4ef229eab8cc',
    messagingSenderId: '958274747173',
    projectId: 'todolist-f5821',
    storageBucket: 'todolist-f5821.appspot.com',
    iosClientId: '958274747173-u8oplqld54m9d2sru0bhuv14217e92ur.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoList',
  );
}
