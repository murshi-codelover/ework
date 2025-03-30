import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytextfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for Search Bar
          SliverAppBar(
            pinned: false,
            floating: true,
            toolbarHeight: 85,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(1.0),
              child: MyTextField(
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
                controller: searchController,
                HintText: 'Search something...',
                LabelText: const Text('Search'),
                ObscureText: false,
              ),
            ),
          ),

          // SliverList for the top container
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:
                    const Center(child: Text('N O  W O R K S  D R O P P E D')),
              ),
            ),
          ),

          // Firestore GridView for work listings
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('works').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No work available')),
                );
              }

              var works = snapshot.data!.docs;

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var work = works[index].data() as Map<String, dynamic>;
                      return Material(
                        elevation: 100,
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to details page
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                height: 140,
                                child: CircleAvatar(
                                  child: Icon(Icons.food_bank, size: 50),
                                ),
                              ),
                              Text(
                                work['work'] ?? 'Unknown Work',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                work['description'] ?? '',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.calendar_month, size: 12),
                                  Text(' ${work['date']}',
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: works.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
