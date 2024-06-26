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
    apiKey: 'AIzaSyDEyxT2TTPKsfvilWSaSxDUK6BmSRyP7BE',
    appId: '1:803956275515:android:994d17e0c51bd8e9efdf1e',
    messagingSenderId: '803956275515',
    projectId: 'pettakecareremake',
    databaseURL: 'https://pettakecareremake-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pettakecareremake.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGPQp6st5ozv-PEWEirQ2Pck-F3RdM2sc',
    appId: '1:803956275515:ios:352f30dc1d1d356befdf1e',
    messagingSenderId: '803956275515',
    projectId: 'pettakecareremake',
    databaseURL: 'https://pettakecareremake-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pettakecareremake.appspot.com',
    androidClientId: '803956275515-5jlnomcnncoaj1l801hbogkfuco6nott.apps.googleusercontent.com',
    iosClientId: '803956275515-7ir9r8v5buh0bll4rmbhsreghe0hq7k5.apps.googleusercontent.com',
    iosBundleId: 'com.example.pettakecare',
  );
}
