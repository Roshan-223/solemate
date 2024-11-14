
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class CarouselSlider1 extends StatelessWidget {
  const CarouselSlider1({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 110.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        initialPage: 0,
      ),
      items: [
        'assests/images/photo-1518002171953-a080ee817e1f.jpg',
        'assests/images/photo-1518002171953-a080ee817e1f.jpg',
        'assests/images/photo-1518002171953-a080ee817e1f.jpg'
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
