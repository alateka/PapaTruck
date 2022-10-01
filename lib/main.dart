import 'package:flutter/material.dart';

import 'views/tabs.dart';
import 'tools/papa_storage.dart';


void main() {
  runApp(const PapaTruck());
}

class PapaTruck extends StatelessWidget {
  const PapaTruck({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PapaTruck',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Tabs(storage: PapaStorage())
    );
  }
}