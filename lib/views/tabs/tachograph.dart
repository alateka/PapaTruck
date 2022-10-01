import 'dart:io';
import 'package:flutter/material.dart';
import 'package:papatruck/models/time_log.dart';

import 'package:papatruck/tools/papa_storage.dart';

class Tachograph extends StatelessWidget {
  const Tachograph({super.key, required this.storage, required this.logs});

  final PapaStorage storage;
  final List<TimeLog> logs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logs.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.alarm),
          trailing: Text(logs[index].description),
          title: Text(logs[index].hour),
        );
      }
    );
  }

  Future<File> _writeLog(String description, String hour) {
    return storage.writeFile(description, hour);
  }
}