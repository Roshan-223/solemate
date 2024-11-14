
import 'package:flutter/material.dart';
import 'package:solemate/presentation/screens/bottom_bar_screens/nav_bar.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';
import 'package:solemate/presentation/screens/utils/constants.dart';
import 'package:solemate/presentation/widget/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      'assests/images/8af3d17dc7113ef31f545b3d22befd98.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: TabBar(
                    dividerColor: kwhite,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                    indicatorColor: myColor,
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
                  // Sign In Content
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          kheight60,
                          const CustomTextField(
                            hintText: 'Email',
                            icon: Icons.email,
                          ),
                          kheight16,
                          const CustomTextField(
                            hintText: 'Password',
                            icon: Icons.password,
                            obscureText: true,
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Handle forgot password functionality
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: myColor),
                              ),
                            ),
                          ),
                          kheight16,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavBar()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myColor,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Sign In',
                                style: TextStyle(color: kwhite)),
                          ),
                          kheight16,
                          OutlinedButton.icon(
                            onPressed: () {
                              // Handle Google sign-in
                            },
                            icon:
                                const Icon(Icons.g_mobiledata, color: myColor),
                            label: const Text(
                              'Sign in with Google',
                              style: TextStyle(color: myColor),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: myColor),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Sign Up Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          kheight60,
                          const CustomTextField(
                              hintText: 'Full Name', icon: Icons.person),
                          kheight16,
                          const CustomTextField(
                              hintText: 'Email', icon: Icons.email_outlined),
                          kheight16,
                          const CustomTextField(
                              hintText: 'Password', icon: Icons.password),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myColor,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Sign Up',
                                style: TextStyle(color: kwhite)),
                          ),
                          kheight16,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
