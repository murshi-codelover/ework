import 'package:flutter/material.dart';
import 'package:newproject/constants/colors/themeprovider.dart';
import 'package:newproject/presentation/mobilescreens/userscreen/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: const HomeScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
