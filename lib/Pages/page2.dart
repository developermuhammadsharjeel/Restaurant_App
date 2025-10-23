import 'package:flutter/material.dart';
import 'package:restaurant/resource/picture.dart';
import 'package:restaurant/resource/colourScheme.dart';
import 'package:restaurant/resource/appFonts.dart';
import 'package:restaurant/resource/setsize.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart' as cs;




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
          //Box 1
          const ImageSliderContainer(),


          //Box2
          Container(
            height: AppSize.screenHeight(context) * 0.1 /1.2,
            width: AppSize.screenWidth(context) * 1,

            decoration: BoxDecoration(
              color: Colors.white,),
            
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                ],
              ),
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

  final cs.CarouselSliderController _controller = cs.CarouselSliderController();
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: cs.CarouselSlider(
        items: imageList.map((item) {
          return Image.asset(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
          );
        }).toList(),
        controller: _controller,
        options: cs.CarouselOptions(
          height: 200,
          autoPlay: !_isHovered, // ✅ Pause on hover
          autoPlayInterval: const Duration(seconds: 2),
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}


//...................Main Products List Buttons

Widget btn( String text,){
  return ElevatedButton(onPressed: (){},
    style: ElevatedButton.styleFrom(
      foregroundColor: colors.red,
    ),
      child: Text(text, style: TextStyle(),),




      );
}