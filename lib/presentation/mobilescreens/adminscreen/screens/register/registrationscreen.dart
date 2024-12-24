import 'package:flutter/material.dart';
import 'package:newproject/presentation/mobilescreens/userscreen/bottomnavigation/works.dart';

class RegistrationScreen extends StatefulWidget {
  final String img;
  const RegistrationScreen({super.key, required this.img});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
          children: const [
            SizedBox(
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
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            '500\$',
                            style: TextStyle(fontSize: 50),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Event: Golden leaf',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ' 11-12-2024 ',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 30),
                            Icon(Icons.timer),
                            Text(
                              ' 8:30 AM',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text(
                            ' Uthram,Thodupuzha',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
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
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.people),
                          Text(
                            '  17/20',
                            style: TextStyle(fontSize: 18),
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
        // bottomNavigationBar: BottomAppBar(
        //   //color: Colors.purple,
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(right: 10),
        //         child: Material(
        //           elevation: 100,
        //           child: Container(
        //             width: 159,
        //             height: double.infinity,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.red,
        //             ),
        //             child: const Center(
        //               child: Text(
        //                 'Save',
        //                 style: TextStyle(fontSize: 20, color: Colors.white),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       Material(
        //         elevation: 100,
        //         child: GestureDetector(
        //           onTap: () {
        //             onRegisterPressed();
        //           },
        //           child: Container(
        //             width: 159,
        //             height: double.infinity,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.green,
        //             ),
        //             child: const Center(
        //               child: Text(
        //                 'Register',
        //                 style: TextStyle(fontSize: 20, color: Colors.white),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
