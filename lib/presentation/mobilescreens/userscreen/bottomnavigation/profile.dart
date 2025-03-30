import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytextfield.dart';

import '../../../Auth/login.dart';

class ABM extends StatelessWidget {
  const ABM({super.key});

  @override
  Widget build(BuildContext context) {
    // void onEditTap() {
    //   return showAboutDialog(
    //     context: context,
    //   );
    // }

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    //  TextEditingController Controller = TextEditingController();
    //  TextEditingController nameController = TextEditingController();
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
                      color: Colors.blueGrey,
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
                                backgroundColor: Colors.blue.shade100,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          MyTextField(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.person)),
                                            HintText: 'Enter your name',
                                            LabelText: const Text('Name'),
                                            controller: nameController,
                                            ObscureText: false,
                                          ),
                                          MyTextField(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.phone)),
                                            HintText: 'Enter your phone number',
                                            LabelText:
                                                const Text('Phone Number'),
                                            controller: phoneController,
                                            ObscureText: false,
                                          ),
                                          MyTextField(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.person)),
                                            HintText: 'Enter your name',
                                            LabelText: const Text('Name'),
                                            controller: nameController,
                                            ObscureText: false,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Material(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                elevation: 10,
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child:
                                                        const Text("Cancel")),
                                              ),
                                              Material(
                                                color: Colors.deepPurple,
                                                elevation: 10,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Save",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Logout  '), Icon(Icons.logout)],
              )),
        ),
      ),
    ));
  }
}
