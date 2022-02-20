import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<Uint8List> getImageBytes(String url) async {
  debugPrint("getting bytes from $url");
  var response = await http.get(Uri.parse(url));
  debugPrint("bytes: ${response.bodyBytes.length}");
  return response.bodyBytes;
}

Future<String?> writeImageBytes(
    {required String url, required String fileName}) async {
  File f = File(fileName);
  try {
    Uint8List bytes = await getImageBytes(url);
    await f.writeAsBytes(bytes);
  } catch (e) {
    debugPrint("err $e");
  }
  return f.absolute.path;
}
