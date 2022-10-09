import 'dart:io';

import 'package:flutter/material.dart';
import 'package:papatruck/main.dart';
import 'package:papatruck/models/time_log.dart';
import 'package:papatruck/tools/papa_storage.dart';

class AddHourPage extends StatelessWidget {
  const AddHourPage({super.key, required this.storage, required this.logs});

  final PapaStorage storage;
  final List<TimeLog> logs;

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    final descriptionField = TextEditingController();
    final hourField = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Añadir hora"),
      ),
      body: Form(  
        key: formKey,  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[  
            TextFormField(  
              controller: descriptionField,
              decoration: const InputDecoration(  
                icon: Icon(Icons.book),  
                hintText: 'Introduce una descripción',  
                labelText: 'Descripción',  
              ),  
            ),  
            TextFormField(  
              controller: hourField,
              decoration: const InputDecoration(  
                icon: Icon(Icons.alarm),  
                hintText: 'Introduce el número de horas',  
                labelText: 'Horas',  
              ),  
            ), 
            Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: ElevatedButton(  
                onPressed: () {
                  _writeLog(descriptionField.text, hourField.text);
                  Navigator.pop(context);
                },
                child: const Text('Añadir'),
              )
            ), 
          ],
        ),  
      )
    );
  }
  Future<File> _writeLog(String description, String hour) async {
    PapaTruck.timeLogs.add(TimeLog(description, hour));
    return storage.rewriteFile();
  }
}