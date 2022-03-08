import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomAlertBox.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomCreditCardDetail.dart';
import 'package:flutter_test_app/components/CustomDropDownTile.dart';
import 'package:flutter_test_app/components/CustomPayementList.dart';
import 'package:flutter_test_app/components/CustomPhonePeGoogleList.dart';
import 'package:flutter_test_app/components/CustomToolTip.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/SavedCard.dart';
import 'package:flutter_test_app/screens/ProfilePage.dart';
import 'package:flutter_test_app/screens/google.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:flutter_test_app/screens/razorPage.dart';
import 'package:flutter_test_app/screens/serviceProviderPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import 'package:super_tooltip/super_tooltip.dart' as tip;
import 'package:simple_tooltip/src/types.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({Key? key}) : super(key: key);

  @override
  _PayementPageState createState() => _PayementPageState();
}

enum PaymentCategory {
  SavedCard,
  CreditDebitCard,
  PhonePeGooglePayBHIM,
  PaytmAmazonWallets,
  NetBanking,
  nothingSelected
}

class _PayementPageState extends State<PayementPage> {
  PaymentCategory _paymentCategory = PaymentCategory.nothingSelected;

  List<SavedCard> _savedCards = [
    SavedCard(
        bankName: "Axis Bank ",
        cardType: "Credit Card",
        cardNo: 4308000011112222),
    SavedCard(
        bankName: "SBI Bank", cardType: "Debit Card", cardNo: 4308000011112222),
  ];

  late int value = 0;

  TextEditingController cardNoController = TextEditingController();
  TextEditingController UPIController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  JustTheController _cartValueController = JustTheController();
  JustTheController _gstValueController = JustTheController();
  JustTheController _deliveryValueController = JustTheController();

  int groupValue = 1;
  bool isCheck2 = true;
  bool ischeck = true;
  late double cartValue;
  late double igst;
  late double gst;
  late double cgst;
  late double sgst;
  late double deliveryCharges;
  void initState() {
    super.initState();
    cartValue = serviceList.price;
    gst = (0.18 / 1.18) * cartValue;

    cgst = 0.5 * gst;
    sgst = 0.5 * gst;

    if (cgst == 0 && sgst == 0) {
      igst = gst;
    } else {
      igst = 0;
    }

    if (cartValue >= 400) {
      deliveryCharges = 0;
      halfPrice = 0.5 * (cartValue);
      prices.halfPayableAmount = halfPrice.toStringAsFixed(2);
      prices.deliveryPrice = "Free";
    } else if (cartValue < 400 && cartValue >= 300) {
      print(cartValue);
      deliveryCharges = 25;
      prices.deliveryPrice = "25";
      halfPrice = 0.5 * (cartValue + deliveryCharges);
      prices.halfPayableAmount = halfPrice.toStringAsFixed(2);
    } else if (cartValue < 300 && cartValue >= 200) {
      deliveryCharges = 50;
      prices.deliveryPrice = "50";
      halfPrice = 0.5 * (cartValue + deliveryCharges);
      prices.halfPayableAmount = halfPrice.toStringAsFixed(2);
    }

    if (serviceCatrogry == ServiceCatrogry.express) {
      deliveryCharges = 0.5 * cartValue;
      halfPrice = 0.5 * (cartValue + deliveryCharges);
      prices.deliveryPrice = deliveryCharges.toStringAsFixed(2);
      prices.halfPayableAmount = halfPrice.toStringAsFixed(2);
    }

    prices.cartValue = cartValue.toStringAsFixed(2);
    prices.gst = gst.toStringAsFixed(2);
    prices.igst = igst.toStringAsFixed(2);
    prices.cgst = cgst.toStringAsFixed(2);
    prices.sgst = sgst.toStringAsFixed(2);

    prices.basePrice = totalPrice.toString();

    print(prices.deliveryPrice);
    print(prices.halfPayableAmount);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 40,
                  color: bluegradientstartColor,
                )),
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
                              thickness: 2,
                              color: bluegradientstartColor,
                            ),
                          ),
                          BorderIcon(
                              isCompleted: true,
                              onPress: () {},
                              iconData: Icons.storefront_outlined),
                          Container(
                            width: MediaQuery.of(context).size.width / 5.5,
                            child: Divider(
                              thickness: 2,
                              color: bluegradientstartColor,
                            ),
                          ),
                          BorderIcon(
                              isCompleted: true,
                              onPress: () {},
                              iconData: Icons.calendar_today_rounded),
                          Container(
                            width: MediaQuery.of(context).size.width / 5.5,
                            child: Divider(
                              thickness: 2,
                              color: bluegradientstartColor,
                            ),
                          ),
                          BorderIcon(
                              isCompleted: false,
                              onPress: () {},
                              iconData: Icons.send_to_mobile_rounded),
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
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(children: [
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
                                      Text("PRICE DETAILS",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: darkGreyColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'helvetica'))
                                    ])),
                            Container(
                                height: 110,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Column(children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Row(
                                          children: [
                                            Text(
                                              "Cart Value",
                                              style: TextStyle(
                                                  fontFamily: 'helvetica'),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomToolTip(
                                                tooltipController:
                                                    _cartValueController,
                                                content: Container(
                                                    height: 60,
                                                    width: 220,
                                                    child: Column(children: [
                                                      GradientText(
                                                        title:
                                                            "Cart Value Break-up",
                                                        isUnderline: true,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Container(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                            Text("Base Price",
                                                                style: TextStyle(
                                                                    color:
                                                                        whiteColor,
                                                                    fontFamily:
                                                                        "Helvetica")),
                                                            Text(
                                                              "\₹ ${totalPrice.toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"),
                                                            )
                                                          ])),
                                                      SizedBox(height: 5),
                                                      Container(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color:
                                                                      whiteColor,
                                                                  size: 14,
                                                                ),
                                                                Text(
                                                                    "Rated Charge",
                                                                    style: TextStyle(
                                                                        color:
                                                                            whiteColor,
                                                                        fontFamily:
                                                                            "Helvetica")),
                                                              ],
                                                            ),
                                                            Text(
                                                              "\₹${(serviceList.price - totalPrice).toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"),
                                                            )
                                                          ]))
                                                    ])))
                                          ],
                                        )),
                                        Text("\₹${serviceList.price}",
                                            style: TextStyle(
                                                fontFamily: 'helvetica')),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Row(
                                          children: [
                                            Text(
                                              "GST (Included)",
                                              style: TextStyle(
                                                  fontFamily: 'helvetica'),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomToolTip(
                                                tooltipController:
                                                    _gstValueController,
                                                content: Container(
                                                    height: 78,
                                                    width: 220,
                                                    child: Column(children: [
                                                      GradientText(
                                                          title: "GST Break-up",
                                                          isUnderline: true),
                                                      SizedBox(height: 10),
                                                      Container(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                            Text("IGST (@18%)",
                                                                style: TextStyle(
                                                                    color:
                                                                        whiteColor,
                                                                    fontFamily:
                                                                        "Helvetica")),
                                                            Text(
                                                              "\₹${igst.toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"),
                                                            )
                                                          ])),
                                                      SizedBox(height: 5),
                                                      Container(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                            Text(
                                                              "CGST(@9%)",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"),
                                                            ),
                                                            Text(
                                                              "\₹${cgst.toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"),
                                                            )
                                                          ])),
                                                      SizedBox(height: 5),
                                                      Container(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                            Text("SGST(@9%)",
                                                                style: TextStyle(
                                                                    color:
                                                                        whiteColor,
                                                                    fontFamily:
                                                                        "Helvetica")),
                                                            Text(
                                                              "\₹${sgst.toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"),
                                                            )
                                                          ]))
                                                    ])))
                                          ],
                                        )),
                                        Text("\₹${gst.toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontFamily: 'helvetica')),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Row(
                                          children: [
                                            Text(
                                              "Delivery Charges",
                                              style: TextStyle(
                                                  fontFamily: 'helvetica'),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomToolTip(
                                                tooltipController:
                                                    _deliveryValueController,
                                                content: serviceCatrogry ==
                                                        ServiceCatrogry.express
                                                    ? Container(
                                                        width: screenSize.width,
                                                        height: 54,
                                                        child:
                                                            Column(children: [
                                                          GradientText(
                                                            title:
                                                                "Express Delivery Charge",
                                                            isUnderline: true,
                                                          ),
                                                          SizedBox(height: 10),
                                                          Text("Express Delivery charge is 50%(half) of the total Cart Value.",
                                                              maxLines: 3,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontFamily:
                                                                      "Helvetica"))
                                                        ]))
                                                    : Container(
                                                        width: screenSize.width,
                                                        height: 78,
                                                        child:
                                                            Column(children: [
                                                          GradientText(
                                                            title:
                                                                "Delivery Charge Break-up",
                                                            isUnderline: true,
                                                          ),
                                                          SizedBox(height: 10),
                                                          Container(
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                Text(
                                                                    "Cart Values\u{2265}\₹400",
                                                                    style: TextStyle(
                                                                        color:
                                                                            whiteColor,
                                                                        fontFamily:
                                                                            "Helvetica")),
                                                                Text(
                                                                  "Free",
                                                                  style: TextStyle(
                                                                      color:
                                                                          whiteColor,
                                                                      fontFamily:
                                                                          "Helvetica"),
                                                                )
                                                              ])),
                                                          SizedBox(height: 5),
                                                          Container(
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                Text(
                                                                    "\₹400>Cart Value\u{2265}\₹300",
                                                                    style: TextStyle(
                                                                        color:
                                                                            whiteColor,
                                                                        fontFamily:
                                                                            "Helvetica")),
                                                                Text(
                                                                  "\₹25",
                                                                  style: TextStyle(
                                                                      color:
                                                                          whiteColor,
                                                                      fontFamily:
                                                                          "Helvetica"),
                                                                )
                                                              ])),
                                                          SizedBox(height: 5),
                                                          Container(
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                Text(
                                                                    "\₹300>Cart Value\u{2265}\₹200",
                                                                    style: TextStyle(
                                                                        color:
                                                                            whiteColor,
                                                                        fontFamily:
                                                                            "Helvetica")),
                                                                Text(
                                                                  "\₹50",
                                                                  style: TextStyle(
                                                                      color:
                                                                          whiteColor,
                                                                      fontFamily:
                                                                          "Helvetica"),
                                                                )
                                                              ]))
                                                        ])))
                                          ],
                                        )),
                                        Text("\₹${prices.deliveryPrice}",
                                            style: TextStyle(
                                                fontFamily: 'helvetica')),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    //padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Divider(
                                      height: 1,
                                      color: bluegradientstartColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                  "Payable 50% Advance",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'helvetica'),
                                                ),
                                              ],
                                            )),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "\₹",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'helvetica'),
                                                  ),
                                                  Text(
                                                      "${prices.halfPayableAmount}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'helvetica'))
                                                ])
                                          ]))
                                ]))
                          ])),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(children: [
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
                                    "PAYMENT MODE",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: darkGreyColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'helvetica'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomDropdownwithTitle(
                                      screenSize: screenSize,
                                      title: "Saved Cards",
                                      icon: _paymentCategory ==
                                              PaymentCategory.SavedCard
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_right_rounded,
                                      onPress: () {
                                        setState(() {
                                          _paymentCategory = _paymentCategory ==
                                                  PaymentCategory.SavedCard
                                              ? PaymentCategory.nothingSelected
                                              : PaymentCategory.SavedCard;
                                        });
                                      }),
                                  _paymentCategory == PaymentCategory.SavedCard
                                      ? Container(
                                          child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: _savedCards.length,
                                          itemBuilder: (context, index) {
                                            return SavedCardList(
                                                groupValue: value,
                                                onChanged: (val) {
                                                  setState(() {
                                                    value = val;
                                                  });
                                                },
                                                Value: index,
                                                isSelected: value == index,
                                                bankName:
                                                    _savedCards[index].bankName,
                                                cardType:
                                                    _savedCards[index].cardType,
                                                cardNo:
                                                    _savedCards[index].cardNo);
                                          },
                                        ))
                                      : Container(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomDropdownwithTitle(
                                      screenSize: screenSize,
                                      title: "Credit/Debit Card",
                                      icon: _paymentCategory ==
                                              PaymentCategory.CreditDebitCard
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_right_rounded,
                                      onPress: () {
                                        setState(() {
                                          _paymentCategory = _paymentCategory ==
                                                  PaymentCategory
                                                      .CreditDebitCard
                                              ? PaymentCategory.nothingSelected
                                              : PaymentCategory.CreditDebitCard;
                                        });
                                      }),
                                  _paymentCategory ==
                                          PaymentCategory.CreditDebitCard
                                      ? CreditDebitDetail(
                                          onCardNo: (val) {},
                                          cardNoController: cardNoController,
                                          cvvController: cvvController,
                                          monthController: monthController,
                                          onChangedCVV: (val) {},
                                          onChangedValidMonth: (val) {},
                                          is_checked: ischeck,
                                          onCheckSelected: () {
                                            setState(() {
                                              ischeck = !ischeck;
                                            });
                                          })
                                      : Container(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomDropdownwithTitle(
                                      screenSize: screenSize,
                                      title: "PhonePe/ Google Pay/ BHIM UPI",
                                      icon: _paymentCategory ==
                                              PaymentCategory
                                                  .PhonePeGooglePayBHIM
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_right_rounded,
                                      onPress: () {
                                        setState(() {
                                          _paymentCategory = _paymentCategory ==
                                                  PaymentCategory
                                                      .PhonePeGooglePayBHIM
                                              ? PaymentCategory.nothingSelected
                                              : PaymentCategory
                                                  .PhonePeGooglePayBHIM;
                                        });
                                      }),
                                  _paymentCategory ==
                                          PaymentCategory.PhonePeGooglePayBHIM
                                      ? PhonepeGooglepayWallet(
                                          UPIController: UPIController,
                                          is_checked: isCheck2,
                                          onCheckSelected: () {
                                            setState(() {
                                              isCheck2 = !isCheck2;
                                            });
                                          },
                                          onChangedUPI: (val) {},
                                          groupValue: groupValue,
                                          onSelectRadioButton: (val) {
                                            setState(() {
                                              print(val);
                                              groupValue = val!;
                                            });
                                          },
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomDropdownwithTitle(
                                      screenSize: screenSize,
                                      title: "Paytm/ Amazon Pay/ Wallets",
                                      icon: _paymentCategory ==
                                              PaymentCategory.PaytmAmazonWallets
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_right_rounded,
                                      onPress: () {
                                        setState(() {
                                          _paymentCategory = _paymentCategory ==
                                                  PaymentCategory
                                                      .PaytmAmazonWallets
                                              ? PaymentCategory.nothingSelected
                                              : PaymentCategory
                                                  .PaytmAmazonWallets;
                                        });
                                      }),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomDropdownwithTitle(
                                      screenSize: screenSize,
                                      title: "Net Banking",
                                      icon: _paymentCategory ==
                                              PaymentCategory.NetBanking
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_right_rounded,
                                      onPress: () {
                                        setState(() {
                                          _paymentCategory = _paymentCategory ==
                                                  PaymentCategory.NetBanking
                                              ? PaymentCategory.nothingSelected
                                              : PaymentCategory.NetBanking;
                                        });
                                      }),
                                  SizedBox(height: 10)
                                ]))
                          ]))
                    ]),
                  )),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: CustomBottomBarButton(
                      isDisable: false,
                      onpress: () {
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //       type: PageTransitionType.rightToLeft,
                        //       child: ProfilePage()),
                        // );

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertBox(
                                removeTitle: "No, PAY 50%",
                                keepTitle: "Yes, PAY 100%",
                                description:
                                    "Do you wish to prepay the full amount of \₹${(halfPrice * 2).toStringAsFixed(2)} instead of payable 50% advance ?",
                                onPressRemove: () {
                                  setState(() {
                                    prices.payableAmount =
                                        prices.halfPayableAmount;
                                  });
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: RazorPayPage(
                                              price: prices.payableAmount)));
                                },
                                onPressKeep: () {
                                  setState(() {
                                    prices.payableAmount =
                                        (halfPrice * 2).toStringAsFixed(2);
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: RazorPayPage(
                                                price: prices.payableAmount)));
                                  });
                                },
                              );
                            });
                      },
                      title: "PAY SECURELY",
                      width: screenSize.width,
                      height: 50,
                      isIcon: true,
                      icon: Icons.security_rounded,
                    )),
              ),
            ])));
  }
}
