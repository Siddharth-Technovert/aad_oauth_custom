// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';

// class CrashAnalyticsService {
//   static final FirebaseCrashlytics _firebaseCrashlytics =
//       FirebaseCrashlytics.instance;

//   static final CrashAnalyticsService _dynamicLinkService =
//       CrashAnalyticsService._internal();

//   factory CrashAnalyticsService() {
//     return _dynamicLinkService;
//   }
//   CrashAnalyticsService._internal();

//   Future recordError(Object ex, StackTrace stackTrace) async {
//     if (kReleaseMode) {
//       await _firebaseCrashlytics.recordError(ex, stackTrace, fatal: true);
//     }
//   }

//   Future recordFlutterError(FlutterErrorDetails error) async {
//     if (kReleaseMode) {
//       await _firebaseCrashlytics.recordFlutterFatalError(error);
//     }
//   }

//   Future setUser(String userId) async {
//     if (kReleaseMode) {
//       await _firebaseCrashlytics.setUserIdentifier(userId);
//     }
//   }
// }
