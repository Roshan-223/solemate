import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solemate/presentation/screens/login/login_screen.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';
import 'package:solemate/presentation/screens/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
              items: [
                Image.asset(
                  'assests/images/photo-1518002171953-a080ee817e1f.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assests/images/desktop-wallpaper-puma-shoe-puma-shoes.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assests/images/8af3d17dc7113ef31f545b3d22befd98.jpg',
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                animateToClosest: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 2.0,
                height: MediaQuery.of(context).size.height,
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 150.0),
                child: Text('Welcome to Solemate',
                    style: GoogleFonts.roboto(
                        color: kwhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 130),
                  child: Text('find your best collections',
                      style: GoogleFonts.roboto(
                          color: kwhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)))),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  // Swipe up detected
                  _navigateToLoginPage(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kheight15,
                    Text(
                      'Swipe up',
                      style: GoogleFonts.roboto(
                        color: kwhite,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    kheight5,
                    const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
