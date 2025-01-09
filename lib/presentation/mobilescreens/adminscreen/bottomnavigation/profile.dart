import 'package:flutter/material.dart';

import '../../../Auth/login.dart';

class ABM extends StatelessWidget {
  const ABM({super.key});

  @override
  Widget build(BuildContext context) {
    void onEditTap() {
      return showAboutDialog(
        context: context,
      );
    }

    // TextEditingController nameController = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const CircleAvatar(
              radius: 100,
              child: Icon(
                Icons.person,
                size: 80,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                'Murshid iqbaal k m',
                style: TextStyle(fontSize: 20),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  return;
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '       Edit profile',
                        style: TextStyle(fontSize: 17),
                      ),
                      IconButton(
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: TextEditingController(),
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                            hintText: 'Enter your name',
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('Save'))
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('Logout  '), Icon(Icons.logout)],
              )),
        ),
      ),
    ));
  }
}
