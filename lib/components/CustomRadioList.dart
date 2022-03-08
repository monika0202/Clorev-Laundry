import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';

class CustomRadioList extends StatelessWidget {
  final int value;
  final int groupValue;
  final onChanged;
  final String flat_no, location, landmark, tag_address;
  final bool isSelected;

  CustomRadioList({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.flat_no = "",
    this.location = "",
    this.landmark = "",
    this.tag_address = "",
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 70,
      margin: EdgeInsets.only(bottom: 10),
      child: RadioListTile(
        activeColor: bluegradientstartColor,
        groupValue: groupValue,
        value: value,
        onChanged: onChanged,
        title: Container(
          // margin: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: isSelected
                  ? LinearGradient(
                      colors: [bluegradientstartColor, bluegradientendColor],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                  : null,
              border: isSelected
                  ? null
                  : Border.all(color: bluegradientstartColor, width: 2),
              color: whiteColor,
              borderRadius: BorderRadius.circular(10)),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 70,
                width: screenSize.width - 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flat_no,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                    ),
                    Text(location,
                        maxLines: 2,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                        )),
                    Text("Landmark: $landmark",
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Container(
                height: 15,
                width: 45,
                // padding: EdgeInsets.only(left: 15, right: 15),
                // margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    gradient: !isSelected
                        ? LinearGradient(
                            colors: [
                              bluegradientstartColor,
                              bluegradientendColor
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          )
                        : null,
                    border: !isSelected
                        ? null
                        : Border.all(color: bluegradientstartColor, width: 2),
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: screenSize.width / 4,
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(
                      tag_address,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'helvetica',
                          fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
