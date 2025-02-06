import 'package:flutter/material.dart';
import 'package:newproject/presentation/mobilescreens/userscreen/bottomnavigation/works.dart';

class RegistrationScreen extends StatefulWidget {
  final String date;
  final String time;
  final String location;
  final String wage;
  final String work;
  final String description;

  const RegistrationScreen({
    super.key,
    required this.date,
    required this.time,
    required this.location,
    required this.wage,
    required this.work,
    required this.description,
    required String workers,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String count = ' 0';
  void onRegisterPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              width: double.infinity,
              height: 90,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Do you want to register',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const WorksPage()));
                          },
                          child: const Text('Yes')),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 300,
              child: Icon(
                Icons.food_bank,
                size: 250,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                // color: Colors.black26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            '${widget.wage}\$',
                            style: const TextStyle(fontSize: 50),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Event: Golden leaf',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            Text(
                              ' ${widget.date}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 30),
                            const Icon(Icons.timer),
                            Text(
                              ' ${widget.time}',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          const Icon(Icons.location_pin),
                          Text(
                            ' ${widget.location}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.phone),
                          Text(
                            ' 7994051281',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          const Icon(Icons.people),
                          Text(
                            count,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          //color: Colors.purple,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Material(
                  elevation: 100,
                  child: Container(
                    width: 159,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 100,
                child: GestureDetector(
                  onTap: () {
                    onRegisterPressed();
                  },
                  child: Container(
                    width: 159,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
