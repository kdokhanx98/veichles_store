class Filtter {
  final String priceLowValue;
  final String pricehigherValue;
  final String mileageLowValue;
  final String mileagehigherValue;
  final String modelYearLowValue;
  final String modelYearhigherValue;
  final List<String> bodyType;
  final List<String> transmission;

  Filtter(
      {required this.priceLowValue,
      required this.pricehigherValue,
      required this.mileageLowValue,
      required this.mileagehigherValue,
      required this.modelYearLowValue,
      required this.modelYearhigherValue,
      required this.bodyType,
      required this.transmission});
}
