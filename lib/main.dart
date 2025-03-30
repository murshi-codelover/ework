import 'package:flutter/material.dart';
import 'package:newproject/constants/colors/themeprovider.dart';
import 'package:newproject/presentation/Auth/login.dart';
import 'package:provider/provider.dart';

void main(dynamic Firebase) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter(); // Initialize Hive for Flutter
  // // Hive.registerAdapter(
  // //     WorkModelAdapter()); // Register the adapter for WorkModel
  // await Hive.openBox<WorkModel>('workBox'); // Open the box
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
