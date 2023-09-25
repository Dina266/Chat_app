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
    apiKey: 'AIzaSyDgTyQunRtJ0mGx2Qi_Tn1N-YnlTLpyK5g',
    appId: '1:239394052825:android:ff41de57aae1f52b517cc8',
    messagingSenderId: '239394052825',
    projectId: 'flutter-79a1a',
    databaseURL: 'https://flutter-79a1a-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-79a1a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxkoLRk0xrZknEoaXsbqqJzxAZ3XxGT3U',
    appId: '1:239394052825:ios:9976397009205f88517cc8',
    messagingSenderId: '239394052825',
    projectId: 'flutter-79a1a',
    databaseURL: 'https://flutter-79a1a-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-79a1a.appspot.com',
    iosClientId: '239394052825-psrnonk8ldhehb5s1r1pploiqr5mjdli.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}