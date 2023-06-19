enum Flavor {
  paid,
  free,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get isPaid => F.appFlavor == Flavor.paid;
  static bool get isFree => F.appFlavor == Flavor.free;

  static String get title {
    switch (appFlavor) {
      case Flavor.paid:
        return 'Paid App';
      case Flavor.free:
        return 'Free App';
      default:
        return '-';
    }
  }

  static String get collectionPrefix {
    switch (appFlavor) {
      case Flavor.paid:
        return 'paid';
      case Flavor.free:
        return 'free';
      default:
        return '-';
    }
  }
}
