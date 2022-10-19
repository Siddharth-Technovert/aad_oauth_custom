import 'package:firebase_core/firebase_core.dart';

import '../core/configs/firebase_options/firebase_options_dev.dart' as dev;
import '../core/configs/firebase_options/firebase_options_prod.dart' as prod;
import '../core/configs/firebase_options/firebase_options_staging.dart'
    as staging;

enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'MassyStores Dev';
      case Flavor.staging:
        return 'MassyStores Staging';
      case Flavor.prod:
        return 'MassyStores';
      default:
        return 'title';
    }
  }

  static FirebaseOptions get firebaseOption {
    switch (appFlavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.android;
      case Flavor.staging:
        return staging.DefaultFirebaseOptions.android;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.android;
      default:
        return dev.DefaultFirebaseOptions.android;
    }
  }
}
