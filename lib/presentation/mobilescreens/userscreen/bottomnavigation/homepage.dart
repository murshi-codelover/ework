import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytextfield.dart';
import 'package:newproject/presentation/mobilescreens/userscreen/screens/register/registrationscreen.dart';

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
                controller: searchController,
                HintText: 'Search something...',
                LabelText: Text('Search'),
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
                child: Center(child: Text('R E G I S T E R E D  W O R K')),
              ),
            ),
          ),
          // SliverGrid for the GridView
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
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
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage(
                                index == 0 ||
                                        index == 3 ||
                                        index == 4 ||
                                        index == 7 ||
                                        index == 8
                                    ? 'assets/cardcover/juice.jpeg'
                                    : 'assets/cardcover/catering.jpeg',
                              ),
                              fit: BoxFit.fill)),
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
