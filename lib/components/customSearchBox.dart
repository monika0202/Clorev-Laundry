import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({
    Key? key,
    required this.screenSize,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final Size screenSize;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [bluegradientstartColor, bluegradientendColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      height: 55,
      margin: EdgeInsets.only(left: 0, right: 0),
      //width: screenSize.width / 1.08,
      child: Container(
        margin: EdgeInsets.all(8),
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.5),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.5)),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.5)),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              filled: true,
              hintText: "Search your regular items here",
              hintStyle: TextStyle(color: Colors.grey[500], height: 0.6),
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
