extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  // String get capitalizeFirstofEach =>
  //     this.split(" ").map((str) => str.capitalize).join(" ");
}
