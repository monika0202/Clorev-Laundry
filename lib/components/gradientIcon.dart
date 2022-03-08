import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class GradientIcon extends StatelessWidget {
  final Widget child;

  const GradientIcon({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
              colors: [bluegradientstartColor, bluegradientendColor],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ).createShader(bounds),
        child: child);
  }
}
