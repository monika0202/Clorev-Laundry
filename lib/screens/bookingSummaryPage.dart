import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomAlertBox.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customListItems.dart';
import 'package:flutter_test_app/components/customListTitle.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/AddToCart.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_test_app/screens/addressPage.dart';
import 'package:flutter_test_app/screens/paymentPage.dart';
import 'package:flutter_test_app/screens/serviceProviderPage.dart';
import 'package:page_transition/page_transition.dart';

class BookingSummaryPage extends StatefulWidget {
  const BookingSummaryPage({Key? key}) : super(key: key);

  @override
  _BookingSummaryPageState createState() => _BookingSummaryPageState();
}

class _BookingSummaryPageState extends State<BookingSummaryPage> {
  int _totalLaundaryPrice = 0;
  int _totalDryCleaningPrice = 0;
  int _totalAddOnPrice = 0;

  int _totalLaundaryItem = 0;
  int _totalDryCleaningItem = 0;
  int _totalAddOnItem = 0;

  List<AddToCart> _cartItems = [];
  List<AddToCart> _cartLaundryItems = [];
  List<AddToCart> _cartDryCleaningItems = [];
  List<AddToCart> _cartSteamPressItems = [];
  List<AddToCart> _cartLeatherCareItems = [];
  List<AddToCart> _cartAddOnItems = [];

  @override
  void initState() {
    _totalLaundaryPrice = 0;
    _totalDryCleaningPrice = 0;
    _totalAddOnPrice = 0;

    _totalLaundaryItem = 0;
    _totalDryCleaningItem = 0;
    _totalAddOnItem = 0;

    _cartItems = [];
    _cartLaundryItems = [];
    _cartDryCleaningItems = [];
    _cartSteamPressItems = [];
    _cartLeatherCareItems = [];
    _cartAddOnItems = [];

    _cartItems = addCart;

    for (var i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].category == "laundry") {
        _totalLaundaryPrice = _totalLaundaryPrice +
            _cartItems[i].sellingPrice!.toInt() * _cartItems[i].quantity!;
        _totalLaundaryItem = _totalLaundaryItem + _cartItems[i].quantity!;
        _cartLaundryItems.add(_cartItems[i]);
      } else if (_cartItems[i].category == "dryCleaning") {
        _totalDryCleaningPrice = _totalDryCleaningPrice +
            _cartItems[i].sellingPrice!.toInt() * _cartItems[i].quantity!;
        _totalDryCleaningItem = _totalDryCleaningItem + _cartItems[i].quantity!;
        _cartDryCleaningItems.add(_cartItems[i]);
      } else if (_cartItems[i].category == "AddOn") {
        _totalAddOnPrice = _totalAddOnPrice +
            _cartItems[i].sellingPrice!.toInt() * _cartItems[i].quantity!;
        _totalAddOnItem = _totalAddOnItem + _cartItems[i].quantity!;
        _cartAddOnItems.add(_cartItems[i]);
      }
    }

    print(_totalAddOnItem);
  }

  _onAlertButtonsPressed1(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "FLAT",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "GRADIENT",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
        )
      ],
    ).show();
  }

  _onAlertButtonsPressed(
    context,
    String name,
    VoidCallback onPressRemove,
  ) {
    Alert(
      context: context,
      //type: AlertType.warning,
      image: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: GradientIcon(
            child: FaIcon(FontAwesomeIcons.exclamationTriangle, size: 50)),
      ),
      //  title: "RFLUTTER ALERT",
      desc: "Are you sure want to remove $name from the cart ?",
      style: AlertStyle(
          animationType: AnimationType.grow,
          isCloseButton: false,
          overlayColor: Colors.black87.withOpacity(0.5),
          descStyle: TextStyle(fontFamily: 'helvetica', fontSize: 17)),
      buttons: [
        DialogButton(
          child: Text(
            "REMOVE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'helvetica',
            ),
          ),
          onPressed: onPressRemove,
          color: Colors.grey[400],
        ),
        DialogButton(
          child: Text(
            "KEEP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'helvetica',
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          gradient: containerGradient,
        )
      ],
    ).show();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded,
                    size: 40, color: bluegradientstartColor)),
            centerTitle: true,
            title: FittedBox(
                child: Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BorderIcon(
                              isCompleted: true,
                              onPress: () {},
                              iconData: Icons.shopping_cart_outlined),
                          Container(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: Divider(
                                  thickness: 2, color: bluegradientstartColor)),
                          BorderIcon(
                              isCompleted: true,
                              onPress: () {},
                              iconData: Icons.storefront_outlined),
                          Container(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: Divider(
                                  thickness: 2, color: bluegradientstartColor)),
                          BorderIcon(
                              isCompleted: true,
                              onPress: () {},
                              iconData: Icons.calendar_today_rounded),
                          DotWidget(
                            dashColor: bluegradientstartColor,
                            dashWidth: 5,
                            totalWidth: MediaQuery.of(context).size.width / 5.5,
                          ),
                          BorderIcon(
                              isCompleted: false,
                              onPress: () {},
                              iconData: Icons.send_to_mobile_rounded)
                        ])))),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/bodybg.png")),
            ),
            child: Stack(children: [
              Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ],
                      color: whiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Column(
                    children: [
                      Container(
                          height: 40,
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
                                  topRight: Radius.circular(10))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("BOOKING SUMMARY",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: darkGreyColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'helvetica'))
                              ])),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Column(children: [
                          GroupedListView<AddToCart, dynamic>(
                              shrinkWrap: true,
                              elements: addCart,
                              groupBy: (element) => element.category,
                              order: GroupedListOrder.DESC,
                              useStickyGroupSeparators: true,
                              groupSeparatorBuilder: (val) => CustomListTitle(
                                  isrounded: true,
                                  title: val,
                                  price: val == "laundry"
                                      ? _totalLaundaryPrice
                                      : val == "dryCleaning"
                                          ? _totalDryCleaningPrice
                                          : _totalAddOnPrice),
                              separator: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              itemBuilder: (c, element) {
                                return Container(
                                    child: Column(children: [
                                  Container(
                                      child: CustomListItem(
                                          onAddPress: () {
                                            setState(() {
                                              element.quantity =
                                                  element.quantity! + 1;

                                              totalPrice = totalPrice +
                                                  element.sellingPrice!.toInt();
                                              totalItems++;

                                              serviceList.price = totalPrice
                                                      .toDouble() *
                                                  (1 +
                                                      0.1 *
                                                          (serviceList.star -
                                                              3.0));

                                              if (element.category ==
                                                  "laundry") {
                                                _totalLaundaryPrice =
                                                    _totalLaundaryPrice +
                                                        element.sellingPrice!
                                                            .toInt();
                                              } else if (element.category ==
                                                  "dryCleaning") {
                                                _totalDryCleaningPrice =
                                                    _totalDryCleaningPrice +
                                                        element.sellingPrice!
                                                            .toInt();
                                              } else if (element.category ==
                                                  "AddOn") {
                                                _totalAddOnPrice =
                                                    _totalAddOnPrice +
                                                        element.sellingPrice!
                                                            .toInt();
                                              }
                                            });
                                          },
                                          onMinusPress: () {
                                            setState(() {
                                              if (element.quantity == 1) {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CustomAlertBox(
                                                          removeTitle: "REMOVE",
                                                          keepTitle: "KEEP",
                                                          description:
                                                              "Are you sure want to remove ${element.name} from the cart ?",
                                                          onPressRemove: () {
                                                            totalItems--;

                                                            totalPrice = totalPrice -
                                                                element
                                                                    .sellingPrice!
                                                                    .toInt();

                                                            serviceList
                                                                .price = totalPrice
                                                                    .toDouble() *
                                                                (1 +
                                                                    0.1 *
                                                                        (serviceList.star -
                                                                            3.0));

                                                            if (element
                                                                    .category ==
                                                                "laundry") {
                                                              _totalLaundaryPrice =
                                                                  _totalLaundaryPrice -
                                                                      element
                                                                          .sellingPrice!
                                                                          .toInt();
                                                            } else if (element
                                                                    .category ==
                                                                "dryCleaning") {
                                                              _totalDryCleaningPrice =
                                                                  _totalDryCleaningPrice -
                                                                      element
                                                                          .sellingPrice!
                                                                          .toInt();
                                                            } else if (element
                                                                    .category ==
                                                                "AddOn") {
                                                              _totalAddOnPrice =
                                                                  _totalAddOnPrice -
                                                                      element
                                                                          .sellingPrice!
                                                                          .toInt();
                                                            }

                                                            addCart.removeWhere((ele) =>
                                                                ele.productID ==
                                                                element
                                                                    .productID);

                                                            Navigator.of(
                                                                    context)
                                                                .pop();

                                                            this.setState(
                                                                () {});
                                                          },
                                                          onPressKeep: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                    });
                                              } else {
                                                element.quantity =
                                                    element.quantity! - 1;

                                                totalItems--;

                                                totalPrice = totalPrice -
                                                    element.sellingPrice!
                                                        .toInt();
                                                serviceList.price = totalPrice
                                                        .toDouble() *
                                                    (1 +
                                                        0.1 *
                                                            (serviceList.star -
                                                                3.0));
                                                if (element.category ==
                                                    "laundry") {
                                                  _totalLaundaryPrice =
                                                      _totalLaundaryPrice -
                                                          element.sellingPrice!
                                                              .toInt();
                                                } else if (element.category ==
                                                    "dryCleaning") {
                                                  _totalDryCleaningPrice =
                                                      _totalDryCleaningPrice -
                                                          element.sellingPrice!
                                                              .toInt();
                                                } else if (element.category ==
                                                    "AddOn") {
                                                  _totalAddOnPrice =
                                                      _totalAddOnPrice -
                                                          element.sellingPrice!
                                                              .toInt();
                                                }
                                              }
                                            });
                                          },
                                          description: element.description!,
                                          sellingPrice:
                                              element.sellingPrice.toString(),
                                          mrp: element.mrp.toString(),
                                          title: element.name!,
                                          quantity:
                                              element.quantity.toString()))
                                ]));
                              })
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 65,
                          padding: EdgeInsets.all(10),
                          width: screenSize.width,
                          //margin: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  bluegradientstartColor,
                                  bluegradientendColor
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Column(children: [
                                    Text(
                                      "$totalItems ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: darkGreyColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    Text("(items)",
                                        style: TextStyle(
                                            color: darkGreyColor,
                                            fontFamily: 'helvetica'))
                                  ]))),
                              SizedBox(width: 10),
                              Container(
                                  height: 40, width: 1, color: darkGreyColor),
                              SizedBox(width: 10),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        Text(
                                          serviceList.title,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: darkGreyColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'helvetica'),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.star_rate_rounded,
                                                        size: 17,
                                                        color: darkGreyColor,
                                                      ),
                                                      Text(
                                                        "${serviceList.star}",
                                                        style: TextStyle(
                                                            color:
                                                                darkGreyColor,
                                                            fontFamily:
                                                                'helvetica'),
                                                      ),
                                                    ],
                                                  )),
                                                  Text(
                                                    "(${serviceList.ratings} Ratings)",
                                                    style: TextStyle(
                                                        color: darkGreyColor,
                                                        fontFamily:
                                                            'helvetica'),
                                                  ),
                                                  Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          "\₹",
                                                          style: TextStyle(
                                                              color:
                                                                  darkGreyColor,
                                                              fontFamily:
                                                                  'helvetica'),
                                                        ),
                                                        Text(
                                                          "${serviceList.price}",
                                                          style: TextStyle(
                                                              color:
                                                                  darkGreyColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'helvetica'),
                                                        ),
                                                      ])
                                                ]))
                                      ])))
                            ],
                          )),
                    ],
                  ),
                ),
                AddressPage(),
              ]))),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: CustomBottomBarButton(
                      isDisable: false,
                      onpress: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: PayementPage()));
                      },
                      title: "RAISE PICK UP CALL",
                      width: screenSize.width,
                      height: 50,
                    )),
              ),
            ])));
  }
}
