import 'package:flutter/material.dart';
import 'package:papatruck/models/time_log.dart';
import 'package:papatruck/tools/papa_storage.dart';

import 'tabs/dashboard.dart';
import 'tabs/tachograph.dart';


class Tabs extends StatefulWidget {
  const Tabs({super.key, required this.storage});

  final PapaStorage storage;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  final List<TimeLog> timeLogs = [];
  
  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((dataFile) {
      if (dataFile.contains("0")) {
        timeLogs.add(TimeLog("No hay nada", "0"));
        widget.storage.createPapaFile();
      } else {
        for (String timeLog in dataFile.split(';;;')) {
          timeLogs.add(
            TimeLog(timeLog.split(';')[0], timeLog.split(';')[1])
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PapaTruck"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: "Panel"
              ),
              Tab(
                icon: Icon(Icons.alarm),
                text: "Tiempos"
              )
            ]
          )
        ),
        body: TabBarView(
          children: [
            const Dashboard(),
            Tachograph(storage: PapaStorage(), logs: timeLogs),
          ]
        )
      )
    );
  }
}