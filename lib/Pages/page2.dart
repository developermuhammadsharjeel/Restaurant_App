import 'package:flutter/material.dart';
import 'package:restaurant/resource/picture.dart';
import 'package:restaurant/resource/colourScheme.dart';


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

      ),
    );
  }
}
