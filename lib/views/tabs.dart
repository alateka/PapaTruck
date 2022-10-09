import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:papatruck/main.dart';
import 'package:papatruck/models/time_log.dart';
import 'package:papatruck/tools/papa_storage.dart';
import 'tabs/dashboard.dart';
import 'tabs/tachograph.dart';
import 'package:papatruck/views/add_hour_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key, required this.storage});

  final PapaStorage storage;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((dataFile) {
      for (var timeLog in jsonDecode(dataFile)) {
        PapaTruck.timeLogs.add(
          TimeLog.fromJson(timeLog)
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PapaTruck"),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Sobre la APP"),
                ),
              ];
            },
            onSelected: (value) {
              if( value == 0 ) {
                // About
              }
            })
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
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
            Tachograph(storage: PapaStorage(), logs: PapaTruck.timeLogs),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 169, 216, 255)),
              borderRadius: BorderRadius.circular(100)),
          onPressed: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => AddHourPage(
                storage: PapaStorage(),
                logs: PapaTruck.timeLogs)))
            .then((value){setState(() {});}),
          child: const Icon(Icons.add),
        ), 
      )
    );
  }
}