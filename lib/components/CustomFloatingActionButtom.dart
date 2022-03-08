import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomFloatinActionButton extends StatelessWidget {
  const CustomFloatinActionButton({
    Key? key,
    required this.icon,
    this.height = 20,
    this.width = 20,
    required this.onPress,
  }) : super(key: key);
  final Icon icon;
  final double height;
  final double width;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: containerGradient,
            borderRadius: BorderRadius.circular(12.5)),
        child: FloatingActionButton(
          onPressed: onPress,
          backgroundColor: Colors.transparent,
          child: icon,
        ));
  }
}
