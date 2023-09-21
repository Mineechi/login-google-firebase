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
    apiKey: 'AIzaSyCMT3A3P_OMuEarkvB-l9F3atxCfzAy-eA',
    appId: '1:148107057844:web:ab22788defb9c79a7255e1',
    messagingSenderId: '148107057844',
    projectId: 'read-c53b3',
    authDomain: 'read-c53b3.firebaseapp.com',
    storageBucket: 'read-c53b3.appspot.com',
    measurementId: 'G-M6H58KW4L6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDerTxwjNgdAr3G8k2p21XWnhCFLd21R5Q',
    appId: '1:148107057844:android:afcc1b7cb6eb2ecd7255e1',
    messagingSenderId: '148107057844',
    projectId: 'read-c53b3',
    storageBucket: 'read-c53b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjFnEjgJVX0s3vTwp2maUpjBLJyi2P9jI',
    appId: '1:148107057844:ios:554276580119ada07255e1',
    messagingSenderId: '148107057844',
    projectId: 'read-c53b3',
    storageBucket: 'read-c53b3.appspot.com',
    iosClientId: '148107057844-22qimglbldmju72jhjk8jnq76ngqc30i.apps.googleusercontent.com',
    iosBundleId: 'com.example.p',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjFnEjgJVX0s3vTwp2maUpjBLJyi2P9jI',
    appId: '1:148107057844:ios:a81c3777f55a82a17255e1',
    messagingSenderId: '148107057844',
    projectId: 'read-c53b3',
    storageBucket: 'read-c53b3.appspot.com',
    iosClientId: '148107057844-ils2l9uamctjiv0cp6rel1utag4l6io5.apps.googleusercontent.com',
    iosBundleId: 'com.example.p.RunnerTests',
  );
}
