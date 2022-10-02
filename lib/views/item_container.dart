import 'package:flutter/material.dart';

Widget itemContainer(String description, String hour) {
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
            trailing: Text(description, style: const TextStyle(color: Colors.white)),
            title: Text(hour,style: const TextStyle(color: Colors.white)),
          ),
        )
      ),
    );
}