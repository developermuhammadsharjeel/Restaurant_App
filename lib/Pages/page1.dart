import 'package:flutter/material.dart';
import 'package:restaurant/resource/picture.dart';
import 'page2.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final screenWidth = MediaQuery.of(context).size.width;
  late final screenHeight = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Stack(
        children: [
          Positioned(
            top: 0,
              child: Image.asset(Images.longlogo,
                fit: BoxFit.fitHeight,
                height: screenHeight *0.8,
                width: screenWidth *1,)),

          Positioned(
            top: 450
            ,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: screenHeight *0.7,
              width: screenWidth *1,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x4D000000),
                    spreadRadius: 15,
                    offset: (Offset(10, 0)),
                    blurRadius: 12,
                  )
                ],
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text("Welcome to Pizza Online 👋", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: "Times New Roman",
                ),),

                Text("Select Your Order Type to continue", style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Times New Roman",
                ),),

                const SizedBox(
                  height: 30,
                ),

                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context)=> const homePage2()),);
                  },
                  child: Container(
                    height: 60,
                    width: screenWidth * 0.9,

                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Icons.delivery_dining, size: 30,)),

                        Expanded(
                          flex: 3,
                          child: const Text("Delivery", style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Times New Roman"
                          )),
                        ),

                        Expanded(
                            flex: 1,
                            child: Icon(Icons.arrow_forward_outlined, size: 25,))
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context)=> const homePage2()),);
                  },
                  child: Container(
                    height: 60,
                    width: screenWidth * 0.9,

                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Icons.shopping_bag_outlined, size: 30,)),

                        Expanded(
                          flex: 3,
                          child: const Text("Pick-UP", style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman"
                          )),
                        ),

                        Expanded(
                            flex: 1,
                            child: Icon(Icons.arrow_forward_outlined, size: 25,))
                      ],
                    ),
                  ),
                ),
              ],
            ),),
          ),
        ],
      ),
    );
  }
}
