import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class BorderIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPress;
  final bool isCompleted;

  const BorderIcon({
    Key? key,
    required this.iconData,
    required this.onPress,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: CircleAvatar(
          //backgroundColor: blueColormedium,
          radius: 20,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              gradient: isCompleted
                  ? LinearGradient(
                      colors: [bluegradientstartColor, bluegradientendColor],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                  : null,

              border: isCompleted
                  ? null
                  : Border.all(color: bluegradientstartColor, width: 2),
              //color: whiteColor,
              //borderRadius: BorderRadius.circular(10)
            ),
            child: CircleAvatar(
              backgroundColor: isCompleted ? Colors.transparent : Colors.white,
              radius: isCompleted ? 20 : 18.5,
              child: isCompleted
                  ? Icon(
                      iconData,
                      color: whiteColor,
                    )
                  : Icon(
                      iconData,
                      color: blackColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
