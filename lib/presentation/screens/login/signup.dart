import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/login_auth/bloc/auth_bloc.dart';
import 'package:solemate/presentation/screens/login/login_screen.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';
import 'package:solemate/presentation/screens/utils/constants.dart';
import 'package:solemate/presentation/widget/custom_textfield.dart';
import 'package:solemate/service/user_model.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpForm({super.key});

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address.';
    }
    const emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword != passwordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Please enter a username.';
    }
    if (username.length < 3) {
      return 'Username must be at least 3 characters.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kheight60,
                // Username Field
                CustomTextField(
                  hintText: 'Username',
                  icon: Icons.person,
                  controller: usernameController,
                  validator: validateUsername,
                ),
                kheight16,
                // Email Field
                CustomTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                  validator: validateEmail,
                ),
                kheight16,
                // Password Field
                CustomTextField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  controller: passwordController,
                  validator: validatePassword,
                ),
                kheight16,
                // Confirm Password Field
                CustomTextField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: validateConfirmPassword,
                ),
                kheight16,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            SignUpEvent(
                              user: UserModel(
                                username: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColor,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Sign Up', style: TextStyle(color: kwhite)),
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      emailController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
                      usernameController.clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
