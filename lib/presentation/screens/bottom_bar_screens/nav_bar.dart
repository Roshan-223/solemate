import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_bloc.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_event.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_state.dart';
import 'package:solemate/presentation/screens/bottom_bar_screens/cart.dart';
import 'package:solemate/presentation/screens/bottom_bar_screens/profile.dart';
import 'package:solemate/presentation/screens/homepage_details/home_page.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  final List<Widget> _navigationItems = [
    const Icon(Icons.home, size: 30, color: Colors.white),
    const Icon(Icons.shopping_bag, size: 30, color: Colors.white),
    const Icon(Icons.person, size: 30, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        backgroundColor: kwhite,
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return _pages[state.selectedIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return CurvedNavigationBar(
              index: state.selectedIndex,
              height: 50.0,
              items: _navigationItems,
              color: Colors.black,
              buttonBackgroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              onTap: (index) {
                context.read<NavigationBloc>().add(NavigationTabChanged(index));
              },
            );
          },
        ),
      ),
    );
  }
}
