import 'package:path_provider/path_provider.dart';

Future<String> documentsPath() async {
  String documentsPath =
      (await getApplicationDocumentsDirectory()).absolute.path;
  return documentsPath;
}
