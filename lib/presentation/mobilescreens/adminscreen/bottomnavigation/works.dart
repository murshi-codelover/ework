import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
