import 'package:flutter/material.dart';
import 'package:papatruck/tools/papa_storage.dart';

import 'tabs/dashboard.dart';
import 'tabs/tachograph.dart';


class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  
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
                  Log(storage: PapaStorage()),
                ]
              )
      )
    );
  }
}