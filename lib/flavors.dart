enum Flavor {
  DEV,
  STAGING,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'MassyStores Dev';
      case Flavor.STAGING:
        return 'MassyStores Staging';
      case Flavor.PROD:
        return 'MassyStores';
      default:
        return 'title';
    }
  }

}
