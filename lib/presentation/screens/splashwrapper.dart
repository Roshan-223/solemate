import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:solemate/firebase_options.dart';
import 'package:solemate/presentation/screens/splash_screen.dart';
import 'package:solemate/main.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  _SplashWrapperState createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  bool _isFirebaseInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await Future.delayed(const Duration(seconds: 5)); // Ensure splash screen is visible for 2 seconds
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    setState(() {
      _isFirebaseInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isFirebaseInitialized) {
      return const SplashScreen();
    }
    return const AuthWrapper();
  }
}
