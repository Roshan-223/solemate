import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_bloc.dart';
import 'package:solemate/business_logic/brand_category/brand_category_bloc.dart';
import 'package:solemate/business_logic/login_auth/bloc/auth_bloc.dart';
import 'package:solemate/firebase_options.dart';
import 'package:solemate/presentation/screens/bottom_bar_screens/nav_bar.dart';
import 'package:solemate/presentation/screens/login/login_screen.dart';
import 'package:solemate/presentation/screens/splash_screen.dart';
import 'package:solemate/presentation/screens/splashwrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(firebaseAuth),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SoleMate',
        theme: ThemeData(),
        home: const SplashWrapper(),
      ),
    );
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen(); // Show splash/loading screen while waiting
        } else if (snapshot.hasData) {
          return NavBar(); // Navigate to main screen if logged in
        } else {
          return const LoginScreen(); // Navigate to login screen if not logged in
        }
      },
    );
  }
}
