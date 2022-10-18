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
}
