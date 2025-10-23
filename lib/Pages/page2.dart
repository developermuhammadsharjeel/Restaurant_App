import 'package:flutter/material.dart';
import 'package:restaurant/resource/picture.dart';
import 'package:restaurant/resource/colourScheme.dart';
import 'package:restaurant/resource/appFonts.dart';
import 'package:restaurant/resource/setsize.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;




class homePage2 extends StatefulWidget {
  const homePage2({super.key});

  @override
  State<homePage2> createState() => _homePage2State();
}

class _homePage2State extends State<homePage2> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: colors.red,
        elevation: 0,

        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.menu , size: 35, color: Colors.white,)),


        // Add Location Logic here
        title: Text("Welcome", style: TextStyle(
          fontFamily: fonts.font1,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),

        //Add search filter / search window here
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.search, size: 35, color: Colors.white,),
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ImageSliderContainer(),

          Container(
            height: AppSize.screenHeight(context) * 0.25, // Example: 30% of screen height
            width: AppSize.screenWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],

      ),
    );
  }
}




//...........................................
// AI Code to do slide show images container

class ImageSliderContainer extends StatefulWidget {
  const ImageSliderContainer({super.key});

  @override
  State<ImageSliderContainer> createState() => _ImageSliderContainerState();
}

class _ImageSliderContainerState extends State<ImageSliderContainer> {
  final List<String> imageList = [
    Images.banner1,
    Images.banner2,
    Images.banner3,
    Images.banner4,

  ];

  final cs.CarouselController _controller = cs.CarouselController();
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: cs.CarouselSlider(
            items: imageList.map((item) {
              return Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            }).toList(),
            carouselController: _controller,
            options: cs.CarouselOptions(
              height: 200,
              autoPlay: !_isHovered,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              aspectRatio: 16 / 9,
            ),
          ),
        ),
      ),
    );
  }
}

