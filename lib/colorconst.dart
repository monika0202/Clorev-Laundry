import 'package:flutter/material.dart';

const Color whiteColor = Colors.white;
const MaterialColor blueColormedium = Colors.blue;
const Color blackColor = Colors.black;
final Color bluegradientstartColor = Color(0xff00cefb);
final Color bluegradientendColor = Color(0xff0091be);
final Color darkGreyColor = Color(0xff404040);
final LinearGradient containerGradient = LinearGradient(
  colors: [bluegradientstartColor, bluegradientendColor],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
