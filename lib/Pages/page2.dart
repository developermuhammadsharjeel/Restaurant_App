import 'package:flutter/material.dart';
import 'package:restaurant/resource/picture.dart';
import 'package:restaurant/resource/colourScheme.dart';
import 'package:restaurant/resource/appFonts.dart';


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
    );
  }
}
