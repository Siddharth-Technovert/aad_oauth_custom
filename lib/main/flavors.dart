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
        return 'RiverpodBoilerplate Dev';
      case Flavor.staging:
        return 'RiverpodBoilerplate Staging';
      case Flavor.prod:
        return 'RiverpodBoilerplate Prod';
      default:
        return 'title';
    }
  }
}
