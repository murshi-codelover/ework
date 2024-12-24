import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytimelinetile.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    bool isPast = true;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const MyTimeLineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              endChild: Text('Registration Completed'),
            ),
            const MyTimeLineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              endChild: Text('15/12/24(8:30)'),
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              endChild: Row(
                children: [
                  const Text('Work Completed'),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isPast = !isPast;
                      });
                    },
                    icon: Icon(
                      Icons.check_box,
                      color: isPast == true ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel Registration',
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
              ),
            )),
      ),
    );
  }
}
