import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  final String img;
  const RegistrationScreen({super.key, required this.img});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Icon(
                Icons.food_bank,
                size: 250,
              ),
            ),
            const Expanded(
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
                        'Location: Uthram,Thodupuzha',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Event: Golden leaf',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Date: 11-12-2024',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Time: 8:30 AM',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Phone: 7994051281',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    // const SizedBox(height: 200),
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
                    child: Center(
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
                child: Container(
                  width: 159,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
