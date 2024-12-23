import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mydrawer.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/themeprovider.dart';
import '../bottomnavigation/homepage.dart';
import '../bottomnavigation/profile.dart';
import '../bottomnavigation/works.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const WorksPage(),
    const ABM(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              icon: const Icon(Icons.light_mode)),
        ],
      ),
      drawer: const MyDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Work'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
