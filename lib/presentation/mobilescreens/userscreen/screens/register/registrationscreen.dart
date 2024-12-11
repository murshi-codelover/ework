import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  final String img;
  RegistrationScreen({super.key, required this.img});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  //color: Colors.blue,
                  image: DecorationImage(
                image: AssetImage(widget.img),
                fit: BoxFit.cover,
              )),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            '500\$',
                            style: TextStyle(fontSize: 50),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Location: Uthram,Thodupuzha',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Event: Golden leaf',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Date: 11-12-2024',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Time: 8:30 AM',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Phone: 7994051281',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 200),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('Save')),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Register')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
