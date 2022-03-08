import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/CustomFloatingActionButtom.dart';

class BrandCategory extends StatelessWidget {
  const BrandCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: NetworkImage(
              "https://images.pexels.com/photos/4210863/pexels-photo-4210863.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
        ),
        Column(
          children: [
            Text(
              "Shirt\n\$0000 / price",
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        CustomFloatinActionButton(
          height: 30,
          width: 30,
          icon: Icon(Icons.add),
          onPress: () {},
        ),
        SizedBox(
          width: 5,
        ),
        Text("2"),
        SizedBox(
          width: 5,
        ),
        CustomFloatinActionButton(
          height: 30,
          width: 30,
          icon: Icon(Icons.add),
          onPress: () {},
        ),
      ],
    );
  }
}
