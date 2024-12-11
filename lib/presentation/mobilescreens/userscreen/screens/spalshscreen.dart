import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newproject/constants/responsive/desktoplayout.dart';
import 'package:newproject/constants/responsive/mobilelayout.dart';
import 'package:newproject/constants/responsive/responsive.dart';
import 'package:newproject/constants/responsive/tabletlayout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileLayout: MobileLayout(),
                tabletLayout: TabletLayout(),
                desktopLayout: DesktopLayout(),
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(child: Image.asset('assets/logo.png')),
      ),
    );
  }
}
