import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: whiteColor,
      child: Center(
        child: Image.asset(
          "assets/images/GIF.gif",
          scale: 5,
        ),
      ),
    );
  }
}
