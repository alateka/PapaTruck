import 'dart:io';

import 'package:flutter/material.dart';
import 'package:papatruck/main.dart';
import 'package:papatruck/tools/papa_storage.dart';

Widget itemContainer(String description, String hour, int id) {  
  return Padding(
    padding: const EdgeInsets.fromLTRB(9, 13, 9, 0),
      child: Container(
        decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 118, 201),
        borderRadius: BorderRadius.circular(9),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 11,
            offset: Offset(0,5)
            )
          ]
        ),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(19),
        ),
        margin: const EdgeInsets.all(5.0),
        alignment: Alignment.center,
        child: ListTile(
          leading: const Icon(Icons.alarm, color: Colors.white,),
          title: Text("$hour : $description",style: const TextStyle(color: Colors.white)),
          trailing: PopupMenuButton<int>(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Modificar'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Eliminar'),
                )
              ];
            },
            onSelected: (int value) {
              if ( value == 1 ) {
                print("Seleccionado: "+id.toString());
              }
              if ( value == 2 ) {
                PapaTruck.timeLogs.removeAt(id);
                writeChanges();
              }
            },
          )
        ),
      )
    ),
  );
}

Future<File> writeChanges() async {
    final PapaStorage storage = PapaStorage();
    return storage.rewriteFile();
}