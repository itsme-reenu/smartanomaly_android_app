
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static  FirebaseOptions web = const FirebaseOptions(
    apiKey: "AIzaSyA2nOabS8x_FfiQFmYtNxU8W7_AbhEKCLY",
  authDomain: "smart-anomaly-detection.firebaseapp.com",
  projectId: "smart-anomaly-detection",
  storageBucket: "smart-anomaly-detection.appspot.com",
  messagingSenderId: "394666428067",
  appId: "1:394666428067:web:3ccd5733a9dc1a2601a116"
  );

   static  FirebaseOptions android = const FirebaseOptions(
    apiKey: "AIzaSyA2nOabS8x_FfiQFmYtNxU8W7_AbhEKCLY",
  authDomain: "smart-anomaly-detection.firebaseapp.com",
  projectId: "smart-anomaly-detection",
  storageBucket: "smart-anomaly-detection.appspot.com",
  messagingSenderId: "394666428067",
  appId: "1:394666428067:web:3ccd5733a9dc1a2601a116"
  );
}
