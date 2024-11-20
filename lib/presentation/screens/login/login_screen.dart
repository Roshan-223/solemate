import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/login_auth/bloc/auth_bloc.dart';
import 'package:solemate/presentation/screens/login/signin.dart';
import 'package:solemate/presentation/screens/login/signup.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return BlocProvider(
      create: (context) => AuthBloc(firebaseAuth),
      child: Scaffold(
        backgroundColor: kwhite,
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      'assests/images/8af3d17dc7113ef31f545b3d22befd98.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: TabBar(
                      dividerColor: kwhite,
                      labelColor: myColor,
                      unselectedLabelColor: Colors.white70,
                      indicatorColor: myColor,
                      indicatorWeight: 4.0,
                      tabs: [
                        Tab(text: 'Sign In'),
                        Tab(text: 'Sign Up'),
                      ],
                    ),
                  ),
                ],
              ),
             
              Expanded(
                child: TabBarView(
                  children: [
                    SignInForm(), 
                    SignUpForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
