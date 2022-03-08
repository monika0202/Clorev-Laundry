import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    Key? key,
    required this.title,
    this.iswhiteColor = false,
    this.isbold = true,
    this.isItalic = false,
    this.isDisable = false,
    this.isUnderline = false,
    this.textSize = 14,
  }) : super(key: key);
  final double textSize;
  final String title;
  final bool isbold;
  final bool isItalic;
  final bool isDisable;
  final bool isUnderline;
  final bool iswhiteColor;

  @override
  Widget build(BuildContext context) {
    return isDisable
        ? Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: textSize,
                color: Colors.grey[500],
                fontWeight: isbold ? FontWeight.bold : null,
                fontFamily: 'helvetica'),
          )
        : iswhiteColor
            ? Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: textSize,
                    color: whiteColor,
                    fontWeight: isbold ? FontWeight.bold : null,
                    fontFamily: 'helvetica'),
              )
            : ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ).createShader(bounds),
                child: Text(
                  title,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                      fontWeight: isbold ? FontWeight.bold : null,
                      fontSize: textSize,
                      fontFamily: 'helvetica',
                      decoration: isUnderline
                          ? TextDecoration.underline
                          : TextDecoration.none),
                ),
              );
  }
}
