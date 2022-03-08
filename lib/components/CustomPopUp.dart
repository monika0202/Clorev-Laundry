import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomDropDownTile.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomAddOn.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/AddOnCategory.dart';
import 'package:flutter_test_app/modals/AddToCart.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';

class CustomPopUpMenu extends StatefulWidget {
  final List addOnItems;
  final String category;
  final VoidCallback onPress;

  CustomPopUpMenu({
    Key? key,
    required this.addOnItems,
    required this.category,
    required this.onPress,
  }) : super(key: key);

  @override
  _CustomPopUpMenuState createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> {
  late List addOnItems;
  bool isadded = false;

  @override
  void initState() {
    // TODO: implement initState

    addOnItems = widget.addOnItems;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * 0.7,
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  GradientText(
                      textSize: 20,
                      isbold: false,
                      title:
                          "We care for your garments and\n your health as well, Do you..?"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          //width: screenSize.width / 1.5,
                          // margin: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  bluegradientstartColor,
                                  bluegradientendColor
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ADD-ONs (Extra Wash-care)",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: darkGreyColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: screenSize.height / 2,
                          // margin: EdgeInsets.only(left: 10, right: 10),
                          // width: screenSize.width / 1.17,
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 100),
                            itemCount: addOnItems.length,
                            itemBuilder: (context, index) => AddOns(
                              title: addOnItems[index].name,
                              price: addOnItems[index].price.toInt().toString(),
                              description: addOnItems[index].description,
                              isAddedItem: addOnItems[index].isAdded,
                              onAddPress: () {
                                setState(() {
                                  addOnItems[index].quantity++;
                                  // totalPrice +=
                                  //     (addOnItems[index].price) as int;
                                  totalItems++;

                                  addCart.last.quantity =
                                      addOnItems[index].quantity;
                                });
                              },
                              onMinusPress: () {
                                setState(() {
                                  if (addOnItems[index].quantity > 1) {
                                    addOnItems[index].quantity--;
                                    // totalPrice -=
                                    //     int.parse(addOnItems[index].price);
                                    totalItems--;
                                    addCart.last.quantity =
                                        addOnItems[index].quantity;
                                  } else {
                                    addOnItems[index].isAdded = false;
                                    isadded = false;
                                    // totalPrice -=
                                    //     int.parse(addOnItems[index].price);
                                    totalItems--;
                                    addCart.removeLast();
                                  }
                                });
                              },
                              onPressFirstAdd: () {
                                setState(() {
                                  addOnItems[index].isAdded =
                                      !addOnItems[index].isAdded;
                                  totalItems++;
                                  // totalPrice +=
                                  //     int.parse(addOnItems[index].price);
                                  isadded = true;

                                  addCart.add(AddToCart(
                                      productID: addOnItems[index].productId,
                                      name: addOnItems[index].name,
                                      description:
                                          addOnItems[index].description,
                                      sellingPrice: addOnItems[index].price,
                                      quantity: addOnItems[index].quantity,
                                      category: widget.category));
                                });
                              },
                              quantity: addOnItems[index].quantity.toString(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomBottomBarButton(
                    isDisable: false,
                    onpress: widget.onPress,
                    title: isadded ? "ADD TO CART" : "SKIP",
                    width: screenSize.width * .4,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
