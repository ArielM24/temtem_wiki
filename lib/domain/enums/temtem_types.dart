enum TemtemType { digital, wind, none }
Map<String, TemtemType> stringTypes = {};

List<TemtemType> fromStringList(List<String> list) {
  List<TemtemType> types = [];
  for (String type in list) {
    types.add(stringTypes[type] ?? TemtemType.none);
  }
  return types;
}
