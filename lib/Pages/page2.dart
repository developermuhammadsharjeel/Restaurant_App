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
  final ScrollController _scrollController = ScrollController();
  double _imageSliderHeight = 200.0;

  @override
  void initState() {
    super.initState();
    const double maxImageSliderHeight = 200.0;
    _scrollController.addListener(() {
      double offset = _scrollController.position.pixels;
      double newHeight = maxImageSliderHeight - offset;
      // Ensure the height doesn't go below 0 or above the max height
      newHeight = newHeight.clamp(0.0, maxImageSliderHeight);
      setState(() => _imageSliderHeight = newHeight);
    });
  }


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
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceOut,
            height: _imageSliderHeight,
            child: const ImageSliderContainer(),
          ),


          //Box2
          Container(
            height: AppSize.screenHeight(context) * 0.1 /1.2,
            width: AppSize.screenWidth(context) * 1,

            decoration: BoxDecoration(
              color: Colors.white,),
            
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  btn("Deals"),
                  btn("Pizza"),
                  btn("Burgers"),
                  btn("Wings"),
                  btn("Drinks"),
                  btn("Beverage"),
                  btn("Sources"),

                ],
              ),
            ),
          ),
          //Box3
          Expanded(
            child: Container(
            width: AppSize.screenWidth(context) *1,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
            ),

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: AppSize.screenHeight(context) * 0.183,
                      width: AppSize.screenWidth(context) * 1,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Deals",style: TextStyle(
                        fontFamily: fonts.font1,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),

                        const SizedBox(height: 20),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(Images.banner1, fit: BoxFit.cover,
                            height: AppSize.screenHeight(context) * 0.12,
                            width: AppSize.screenWidth(context)*1,
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),

                  ProductBox(title: "Deal 1", text: "A burger with pizza", price: 20, path: Images.deal1),
                  ProductBox(title: "Deal 1", text: "A burger with pizza", price: 20, path: Images.deal1),
                  ProductBox(title: "Deal 1", text: "A burger with pizza", price: 20, path: Images.deal1),
                  ProductBox(title: "Deal 1", text: "A burger with pizza", price: 20, path: Images.deal1),
                  ProductBox(title: "Deal 1", text: "A burger with pizza", price: 20, path: Images.deal1),
                  ProductBox(title: "Deal 1", text: "A burger with pizza", price: 20, path: Images.deal1),


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
  return Padding(
    padding: const EdgeInsets.all(8.0),

    child: SizedBox(
      height: 48,
      child: ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),

          foregroundColor: Colors.white,
          backgroundColor: colors.red,
        ),
          child: Text(text, style: TextStyle(),),


          ),
    ),
  );
}


//.................. Products boxes

class ProductBox extends StatefulWidget {
  final String title;
  final String text;
  final double price;
  final String path;

  const ProductBox({
    super.key,
    required this.title,
    required this.text,
    required this.price,
    required this.path,
  });

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {

    //...................................................................
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: AppSize.screenHeight(context) *0.12,
        width: AppSize.screenWidth(context) *1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: fonts.font1,
                fontSize: 25,
              ),),

              Text(widget.text,style: TextStyle(
                fontFamily: fonts.font1,
                fontSize: 15,
              ),),
              Text("\$${widget.price}",style: TextStyle(
                fontFamily: fonts.font1,
                fontSize: 15,
              ),),
              const SizedBox(height: 10),
            ]
          ),
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(widget.path, fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
