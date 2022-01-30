import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<Uint8List> getImageBytes(String url) async {
  debugPrint("getting bytes");
  var response = await http.get(Uri.parse(url));
  debugPrint("bytes: ${response.bodyBytes.length}");
  return response.bodyBytes;
}
