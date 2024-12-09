import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                  width: double.infinity,
                  height: 180,
                ),
                const Positioned(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child:
                        CircleAvatar(radius: 60, backgroundColor: Colors.green),
                  ),
                ),
                const Positioned(
                  left: 75,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child:
                        CircleAvatar(radius: 60, backgroundColor: Colors.blue),
                  ),
                ),
                const Positioned(
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child:
                        CircleAvatar(radius: 60, backgroundColor: Colors.green),
                  ),
                ),
              ],
            ),
            const Text(
              'Powered by ABM',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
