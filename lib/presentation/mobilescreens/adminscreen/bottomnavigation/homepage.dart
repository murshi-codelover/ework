import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytextfield.dart';
import 'package:newproject/presentation/mobilescreens/adminscreen/screens/register/registrationscreen.dart';

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
            // backgroundColor: Colors.white,
            toolbarHeight: 85,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(1.0),
              child: MyTextField(
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
                child: const Center(child: Text('N O  W O R K S  D R O P E D')),
              ),
            ),
          ),
          // SliverGrid for the GridView
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Material(
                    elevation: 100,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegistrationScreen(
                                  img: index == 0 ||
                                          index == 3 ||
                                          index == 4 ||
                                          index == 7 ||
                                          index == 8
                                      ? 'assets/cardcover/juice.jpeg'
                                      : 'assets/cardcover/catering.jpeg',
                                )));
                      },
                      child: Container(
                        child: const Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 140,
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.food_bank,
                                    size: 50,
                                  ),
                                )),
                            Text(
                              'Golden Leaf',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Catering work',
                              style: TextStyle(fontSize: 12),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 12,
                                ),
                                Text(' 21-12-24',
                                    style: TextStyle(fontSize: 12))
                              ],
                            ),
                            // const Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(
                            //       Icons.location_pin,
                            //       size: 12,
                            //     ),
                            //     Text(
                            //       ' Thodupuzha',
                            //       style: TextStyle(fontSize: 12),
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.blue,
                        //       borderRadius: BorderRadius.circular(8.0),
                        //       image: DecorationImage(
                        //           image: AssetImage(
                        //             index == 0 ||
                        //                     index == 3 ||
                        //                     index == 4 ||
                        //                     index == 7 ||
                        //                     index == 8
                        //                 ? 'assets/cardcover/juice.jpeg'
                        //                 : 'assets/cardcover/catering.jpeg',
                        //           ),
                        //           fit: BoxFit.fill)),
                        // ),
                        //    ),
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
