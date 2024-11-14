

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_bloc.dart';
import 'package:solemate/business_logic/brand_category/brand_category_bloc.dart';
import 'package:solemate/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SoleMate',
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
