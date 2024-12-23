import 'package:flutter/material.dart';

class ABM extends StatelessWidget {
  const ABM({super.key});

  @override
  Widget build(BuildContext context) {
    void onEditTap() {
      return showAboutDialog(
        context: context,
      );
    }

    TextEditingController nameController = TextEditingController();
    return Scaffold(
        body: Scaffold(
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
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '       Edit profile',
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
