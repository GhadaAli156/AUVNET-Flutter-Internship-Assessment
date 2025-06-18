import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship/features/home/presentation/bolc/home_bloc.dart';import 'package:flutter_internship/features/home/presentation/bolc/home_bloc.dart';
import 'package:flutter_internship/features/home/presentation/widgets/text_item.dart';
import '../../../../core/colors/colors.dart';
import '../bolc/home_event.dart';
import '../bolc/home_state.dart';
import '../widgets/custom_container_details.dart';
import '../widgets/got_a_code.dart';
import '../widgets/restaurant_item.dart';
import '../widgets/service_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadRestaurants());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.light,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        backgroundColor: ColorManager.light,
        currentIndex: 0,
        selectedItemColor: ColorManager.buttonColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nawel.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/cat_icon.png',
              width: 24,
              height: 24,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/deliver_icon.png',
              width: 24,
              height: 24,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const custom_container_details(),
            const SizedBox(height: 20,),
            TextItem(text: "Services:"),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                ServiceCard('Up to 50%',image: Image.asset("assets/images/food.png"), label: 'Food'),
                ServiceCard('20 mins',image: Image.asset("assets/images/health.png"), label: 'Health'),
                ServiceCard('15 mins',image: Image.asset("assets/images/groceries.png"), label: 'Groceries'),
              ],
            ),
            const SizedBox(height: 20),
            const GotACode(),
            const SizedBox(height: 20),
            TextItem(text: "Shortcuts:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                ServiceCard('',image: Image.asset("assets/images/past_order.png"), label: 'Past Order'),
                ServiceCard('',image: Image.asset("assets/images/super_saver.png"), label: 'Super Saver'),
                ServiceCard('',image: Image.asset("assets/images/give_back.png"), label: 'Give Back'),
                ServiceCard('',image: Image.asset("assets/images/star.png"), label: 'Best Sellers'),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/slider_img.png'),
            const SizedBox(height: 20),
            TextItem(text: 'Popular restaurants nearby'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                ServiceCard('32 mins',image: Image.asset("assets/images/Allo_Beirut.png"), label: 'Allo Beirut'),
                ServiceCard('38 mins',image: Image.asset("assets/images/Laffah.png"), label: 'Laffah'),
                ServiceCard('44 mins',image: Image.asset("assets/images/Falafil.png"), label: 'Falafil'),
                ServiceCard('34 mins',image: Image.asset("assets/images/Barbar.png"), label: 'Barbar'),
              ],
            ),

            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  return Column(
                    children: state.restaurants
                        .map((r) => RestaurantItem(
                      name: r.name,
                      image: r.image,
                      time: r.time,
                    ))
                        .toList(),
                  );
                } else if (state is HomeError) {
                  return Text('Error: ${state.message}');
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}



