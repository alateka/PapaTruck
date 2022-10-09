import 'package:flutter/material.dart';
import 'package:papatruck/models/time_log.dart';

import 'package:papatruck/tools/papa_storage.dart';
import 'package:papatruck/views/item_container.dart';

class Tachograph extends StatelessWidget {
  const Tachograph({super.key, required this.storage, required this.logs});

  final PapaStorage storage;
  final List<TimeLog> logs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
         image: Image.asset('assets/background_blur.jpg').image,
         fit: BoxFit.cover
        )
      ),
      child: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (BuildContext context, int index) {
          return itemContainer(logs[index].description, logs[index].hour, index);
        }
      ),
    );
  }
}