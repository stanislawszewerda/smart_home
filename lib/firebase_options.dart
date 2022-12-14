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
    apiKey: 'AIzaSyBe21_Ts2J2rE5UMOfWwuDshwmdGoQCfUA',
    appId: '1:814578210785:web:f02ab1460b583eb3fca4a0',
    messagingSenderId: '814578210785',
    projectId: 'smart-home-7c806',
    authDomain: 'smart-home-7c806.firebaseapp.com',
    storageBucket: 'smart-home-7c806.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDshwQNHv-AHyV1w6B0U3YU7TbARQIW-pM',
    appId: '1:814578210785:android:b4d2489b2d48262bfca4a0',
    messagingSenderId: '814578210785',
    projectId: 'smart-home-7c806',
    storageBucket: 'smart-home-7c806.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD84G9t-kVmWd-uF_xUV3roee9V7fwIaNc',
    appId: '1:814578210785:ios:0779dca356f89314fca4a0',
    messagingSenderId: '814578210785',
    projectId: 'smart-home-7c806',
    storageBucket: 'smart-home-7c806.appspot.com',
    iosClientId: '814578210785-gv534hgnvkub5pr2lq3lspvv6tvikh52.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartHome',
  );
}
