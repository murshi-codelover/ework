import 'package:flutter/material.dart';
import 'package:newproject/constants/colors/themeprovider.dart';
import 'package:provider/provider.dart';

import 'presentation/mobilescreens/userscreen/screens/spalshscreen.dart';

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
      home: const SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
