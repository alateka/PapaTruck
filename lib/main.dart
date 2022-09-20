import 'package:flutter/material.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: 'PapaTruck'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
                text: "Panel",
              ),
              Tab(
                icon: Icon(Icons.alarm),
                text: "Tiempos",
              ),
            ],
          ),
        ),
        body: const TabBarView(
                children: [
                  Center(
                    child: Text("Panel gráfico"),
                  ),
                  Center(
                    child: Text("Tiempos de conducción y descanso del tacógrafo"),
                  ),
                ],
              ),
      ),
    );
  }
}