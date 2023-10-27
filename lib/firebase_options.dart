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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZaJ3-ln0V_QfA7MVIO34nf29Io9RHBmw',
    appId: '1:164646770423:android:1fcf1f3103bd499ddda5f2',
    messagingSenderId: '164646770423',
    projectId: 'wechat-80d79',
    storageBucket: 'wechat-80d79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmY4jJ_UmaB21LAKFMm5X4ZlgpFrIzCc8',
    appId: '1:164646770423:ios:a4466fe02128f0d3dda5f2',
    messagingSenderId: '164646770423',
    projectId: 'wechat-80d79',
    storageBucket: 'wechat-80d79.appspot.com',
    androidClientId:
        '164646770423-e8i6osudctnq8p16849pvl7hkl8oth2r.apps.googleusercontent.com',
    iosClientId:
        '164646770423-uck15s463s6fg9m33vqe65t5bibe8io0.apps.googleusercontent.com',
  );
}
