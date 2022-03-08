import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/CustomFloatingActionButtom.dart';
import 'package:flutter_test_app/components/GradientText.dart';

import 'GradientButton.dart';

class CustomListItem extends StatelessWidget {
  final bool isAddedItem;

  final VoidCallback onAddPress, onMinusPress;
  final String sellingPrice, title, quantity, description, mrp;
  // final String? sprice;
  const CustomListItem({
    Key? key,
    this.isAddedItem = false,
    required this.onAddPress,
    required this.onMinusPress,
    required this.description,
    required this.sellingPrice,
    required this.mrp,
    required this.title,
    required this.quantity,
    // required this.sprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -1),
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
                  "\₹$mrp",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  " \₹${sellingPrice} / pc",
                  style: TextStyle(fontFamily: 'Helvetica'),
                ),
              ],
            )),
        trailing: QuantityAddSubstract(
          title: quantity,
          onDrement: onMinusPress,
          onInCrement: onAddPress,
        ));
  }
}

class QuantityAddSubstract extends StatelessWidget {
  const QuantityAddSubstract({
    Key? key,
    this.title = "2",
    required this.onInCrement,
    required this.onDrement,
  }) : super(key: key);
  final String title;
  final VoidCallback onInCrement, onDrement;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomFloatinActionButton(
            icon: Icon(Icons.remove),
            height: 25,
            width: 25,
            onPress: onDrement,
          ),
          GradientText(
            title: "$title",
            textSize: 17,
          ),
          CustomFloatinActionButton(
            onPress: onInCrement,
            icon: Icon(Icons.add),
            height: 25,
            width: 25,
          ),
        ],
      ),
    );
  }
}
