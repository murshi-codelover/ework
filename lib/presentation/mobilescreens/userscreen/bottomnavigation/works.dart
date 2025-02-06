import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newproject/constants/widgets/mytimelinetile.dart';

import '../../../../db/workmodel.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  void registerWorker(Box<WorkModel> box, WorkModel workItem) {
    if (workItem.registeredWorkers < ((workItem.workers as num) ?? 0)) {
      workItem.registeredWorkers += 1;
      box.put(workItem.work, workItem); // Save the update in Hive
    }
  }

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
                  Builder(
                    builder: (context) {
                      final workItem =
                          WorkModel(); // Define and initialize workItem
                      return IconButton(
                        onPressed: workItem.registeredWorkers >=
                                (workItem.workers as num ?? 0)
                            ? null // Disable button when limit is reached
                            : () {
                                setState(() {
                                  registerWorker(
                                      Hive.box<WorkModel>('workBox'), workItem);
                                });
                              },
                        icon: Icon(
                          Icons.check_box,
                          color: workItem.registeredWorkers >=
                                  (workItem.workers as num ?? 0)
                              ? Colors.grey // Indicate registration is full
                              : Colors.green,
                        ),
                      );
                    },
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
