import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/customDropDownItem.dart';

class AddOns extends StatelessWidget {
  final bool isAddedItem;
  final VoidCallback onPressFirstAdd;
  final VoidCallback onAddPress, onMinusPress;
  final String price, title, description, quantity;
  //final String? sprice;
  const AddOns({
    Key? key,
    this.isAddedItem = false,
    required this.onPressFirstAdd,
    required this.onAddPress,
    required this.onMinusPress,
    required this.price,
    required this.title,
    required this.quantity,
    required this.description,
    //required this.sprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        visualDensity: VisualDensity(horizontal: 2, vertical: 0),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        leading: Icon(
          Icons.circle,
          size: 40,
        ),
        title: Transform.translate(
            offset: Offset(-10, 0),
            child: Text(
              "$title {$description}",
              style: TextStyle(fontFamily: 'Helvetica'),
            )),
        subtitle: Transform.translate(
            offset: Offset(-10, 0),
            child: Row(
              children: [
                Text(
                  " \₹${price} / pc",
                  style: TextStyle(fontFamily: 'Helvetica'),
                ),
              ],
            )),
        trailing: isAddedItem
            ? QuantityAddSubstract(
                title: quantity,
                onDrement: onMinusPress,
                onInCrement: onAddPress,
              )
            : GradientButton(
                width: 90,
                onPress: onPressFirstAdd,
                title: "+ ADD",
                isBorderCircular: false,
              ));
    ;
  }
}
