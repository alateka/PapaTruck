import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PapaStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/papatruck.data');
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

  Future<File> writeFile(String description, String hour) async {
    final file = await _localFile;
    return file.writeAsString('$description;$hour;;;', mode: FileMode.append);
  }

  Future<File> createPapaFile() async {
    final file = await _localFile;

    return file.writeAsString("");
  }
}