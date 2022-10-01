import 'dart:io';
import 'package:flutter/material.dart';

import 'package:papatruck/tools/papa_storage.dart';

class Log extends StatelessWidget {
  const Log({super.key, required this.storage});

  final PapaStorage storage;

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
        onPressed: _writeLog,
        tooltip: 'Añadir hora',
        child: const Icon(Icons.add),
      ),
      )
    );
  }

  Future<File> _writeLog() {
    return storage.writeFile(3);
  }
}