import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/login_auth/bloc/auth_bloc.dart';
import 'package:solemate/presentation/screens/bottom_bar_screens/nav_bar.dart';
import 'package:solemate/presentation/screens/login/forgot_password.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';
import 'package:solemate/presentation/screens/utils/constants.dart';
import 'package:solemate/presentation/widget/custom_textfield.dart';
import 'package:solemate/service/auth_service.dart';
import 'package:solemate/service/user_model.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInForm({super.key});

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email address.';
    }
    const emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password.';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              emailController.clear();
              passwordController.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NavBar()),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kheight60,
                  CustomTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                    validator: validateEmail,
                  ),
                  kheight16,
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                    validator: validatePassword,
                  ),
                  kheight16,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                user: UserModel(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  username: '',
                                ),
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child:
                        const Text('Sign In', style: TextStyle(color: kwhite)),
                  ),
                  kheight16,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  kheight16,
                  ElevatedButton.icon(
                    onPressed: () async {
                      User? user = await AuthService().signInWithGoogle();

                      if (user != null) {
                        // Use null-aware operators to access email and displayName safely
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                user: UserModel(
                                  email: user.email ??
                                      'No email', // Provide a default value if email is null
                                  password: '', // Can leave blank
                                  username: user.displayName ??
                                      'No name', // Provide a default value if displayName is null
                                ),
                              ),
                            );
                      } else {
                        // Handle the case when user is null (optional)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Google sign-in failed')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kwhite,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(Icons.g_mobiledata, color: Colors.black),
                    label: const Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  kheight16,
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
