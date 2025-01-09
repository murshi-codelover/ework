import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newproject/constants/colors/themeprovider.dart';
import 'package:newproject/presentation/Auth/login.dart';
import 'package:provider/provider.dart';

import 'db/workmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive for Flutter
  Hive.registerAdapter(
      WorkModelAdapter()); // Register the adapter for WorkModel
  await Hive.openBox<WorkModel>('workBox'); // Open the box

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
