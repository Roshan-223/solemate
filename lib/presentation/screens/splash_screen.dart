import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // CarouselSlider for background images
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
              autoPlay: true,
              viewportFraction: 1.0,
              height: MediaQuery.of(context).size.height,
                autoPlayInterval: const Duration(seconds: 1),  
              autoPlayAnimationDuration: const Duration(milliseconds: 800),  
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 150.0),
              child: Text(
                'Welcome to Solemate',
                style: GoogleFonts.roboto(
                  color: kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 130),
              child: Text(
                'Find your best collections',
                style: GoogleFonts.roboto(
                  color: kwhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
