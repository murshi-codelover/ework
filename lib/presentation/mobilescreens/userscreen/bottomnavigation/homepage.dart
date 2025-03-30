import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../db/workmodel.dart';
import '../screens/register/registrationscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search work...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),

          // 🔥 Fetch Firestore Data
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('works')
                  .orderBy('date', descending: true) // Ensure data order
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No Work Items Found'));
                }

                // Convert Firestore data to WorkModel list
                List<WorkModel> items = snapshot.data!.docs
                    .map((doc) => WorkModel.fromFirestore(doc))
                    .toList();

                // 🔍 Filter items based on search
                if (searchQuery.isNotEmpty) {
                  items = items
                      .where((item) => item.work
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()))
                      .toList();
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final workItem = items[index];

                    return GestureDetector(
                      onTap: () {
                        final uuid = Uuid();
                        String generatedUserId =
                            uuid.v4(); // Generates a unique ID

                        final workItem = items[index]; // Get the selected item
                        // Check if the user is logged in
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(
                                date: workItem.date ?? '',
                                workers: workItem.workers ?? '',
                                description: workItem.description ?? '',
                                location: workItem.location ?? '',
                                time: workItem.time ?? '',
                                work: workItem.work,
                                wage: workItem.wage ?? '',
                                userId: user.uid, // ✅ Assign Firebase user ID
                              ),
                            ),
                          );
                        } else {
                          print("User not logged in!");
                        }
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 58,
                                  child: Icon(Icons.work, size: 60),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  workItem.work,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.calendar_month, size: 18),
                                    Text(workItem.date ?? 'No Date'),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.deepPurple,
                                ),
                                child: const Icon(Icons.check,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
