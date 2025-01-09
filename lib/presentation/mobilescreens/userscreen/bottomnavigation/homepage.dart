import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../db/workmodel.dart';
import '../screens/register/registrationscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late final Box<WorkModel> workBox;

  @override
  void initState() {
    super.initState();

    // Initialize the box
    //   try {
    //     workBox = Hive.box<WorkModel>('workBox');
    //   } catch (e) {
    //     print('Error initializing Hive box: $e');
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ValueListenableBuilder<Box<WorkModel>>(
        valueListenable: Hive.box<WorkModel>('workBox').listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No Work Items Found'));
          }

          List<WorkModel> items = box.values.toList();

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: true,
                toolbarHeight: 85,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        items = box.values
                            .where((item) =>
                                item.work
                                    ?.toLowerCase()
                                    .contains(value.toLowerCase()) ??
                                false)
                            .toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search something...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text('REGISTERED WORK'),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 3 / 4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final workItem = items[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(
                                date: workItem.date ?? 'No Date',
                                time: workItem.time ?? 'No Time',
                                location: workItem.location ?? 'No Location',
                                wage: workItem.wage ?? 'No Wage',
                                work: workItem.work ?? 'No Work',
                                description:
                                    workItem.description ?? 'No Description',
                              ),
                            ),
                          );
                        },
                        child: Card(
                          //color: Colors.white,
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
                                    child: Icon(Icons.food_bank, size: 60),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Golden caters',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Text(
                                  //   workItem.work ?? 'No Title',
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 18,
                                      ),
                                      Text(
                                        workItem.date ?? 'not valid',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        size: 18,
                                      ),
                                      const Text(
                                        '17/20' ?? 'not valid',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.deepPurple,
                                ),
                                child: Icon(Icons.water),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: items.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
