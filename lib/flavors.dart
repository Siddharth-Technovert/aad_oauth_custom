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
        return 'RiverpodBoilerplate Dev';
      case Flavor.STAGING:
        return 'RiverpodBoilerplate Staging';
      case Flavor.PROD:
        return 'RiverpodBoilerplate Prod';
      default:
        return 'title';
    }
  }

}
