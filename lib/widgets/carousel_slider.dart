import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/banner1.jpg',
      'assets/images/banner2.jpg',
      'assets/images/banner3.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: imgList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(item),
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