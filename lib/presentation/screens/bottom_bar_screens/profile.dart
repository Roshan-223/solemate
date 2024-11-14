
import 'package:flutter/material.dart';
import 'package:solemate/presentation/screens/account_settings_screen/about.dart';
import 'package:solemate/presentation/screens/account_settings_screen/my_address.dart';
import 'package:solemate/presentation/screens/account_settings_screen/my_orders.dart';
import 'package:solemate/presentation/screens/account_settings_screen/privacy_policy.dart';
import 'package:solemate/presentation/screens/login/login_screen.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';
import 'package:solemate/presentation/screens/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({super.key});

  final List<Map<String, dynamic>> options = const [
    {'icon': Icons.location_on, 'title': 'My Address', 'page': MyAddress()},
    {'icon': Icons.shopping_bag, 'title': 'My Orders', 'page': MyOrders()},
    {
      'icon': Icons.privacy_tip,
      'title': 'Privacy and Policy',
      'page': PrivacyPolicy()
    },
    {'icon': Icons.info, 'title': 'About', 'page': AboutScreen()},
    {'icon': Icons.logout, 'title': 'Log Out', 'isLogout': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: kwhite,
              ),
            ),
          ],
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight20,
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: kwhite,
                      backgroundImage: AssetImage(
                          'assests/images/bad786dfe4f227555be6fa2484b0b9a3.jpg'),
                    ),
                    kheight16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'User Address',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return ListTile(
            leading: Icon(
              option['icon'],
              color: option['isLogout'] == true ? Colors.red : Colors.black,
            ),
            title: Text(
              option['title'],
              style: TextStyle(
                color: option['isLogout'] == true ? Colors.red : Colors.black,
              ),
            ),
            onTap: () {
              if (option['isLogout'] == true) {
                _showLogoutDialog(context);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => option['page']),
                );
              }
            },
          );
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
