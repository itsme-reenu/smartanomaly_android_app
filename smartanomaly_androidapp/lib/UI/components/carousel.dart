import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}
class _ImageCarouselState extends State<ImageCarousel> {
  
final List<String> imageUrls = [
  'assets/images/carousel 1.png',
  'assets/images/carousel 2.png',
  'assets/images/carousel 3.png',
  'assets/images/carousel 4.png',
];


 @override
 Widget build(BuildContext context) {
   return CarouselSlider(
     options: CarouselOptions(
       height: double.infinity,
       aspectRatio: MediaQuery.of(context).size.aspectRatio,
       enlargeCenterPage: true,
       autoPlay: true,
       autoPlayInterval: const Duration(seconds: 3),
       autoPlayAnimationDuration: const Duration(milliseconds: 800),
       autoPlayCurve: Curves.fastOutSlowIn,
       pauseAutoPlayOnTouch: true,
       onPageChanged: (index, reason) {},
     ),
     items: imageUrls.map((imageUrl) {
       return Builder(
         builder: (BuildContext context) {
           return Image.asset(
             imageUrl,
             fit: BoxFit.cover,
           );
         },
       );
     }).toList(),
   );
 }
}