enum Flavor {
  development,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'MPIA - Development';
      case Flavor.staging:
        return 'MPIA - Staging';
      case Flavor.prod:
        return 'MPIA';
      default:
        return 'title';
    }
  }

}
