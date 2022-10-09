import 'dart:io';
import 'package:papatruck/main.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class PapaStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/papatruck.json');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final String fileData = await file.readAsString();
      return fileData;

    } catch (e) {
      return "0";
    }
  }

  Future<File> rewriteFile() async {
    createPapaFile();
    final file = await _localFile;
    String convertedJSON = jsonEncode(PapaTruck.timeLogs);
    return file.writeAsString(convertedJSON);
  }

  Future<File> createPapaFile() async {
    final file = await _localFile;
    return file.writeAsString("");
  }
}