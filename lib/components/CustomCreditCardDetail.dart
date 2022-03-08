import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:page_transition/page_transition.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'gradientIcon.dart';

class CreditDebitDetail extends StatefulWidget {
  final onChangedValidMonth;
  final onCardNo;
  final onChangedCVV;
  final VoidCallback onCheckSelected;
  final bool is_checked;
  final TextEditingController cardNoController;
  final TextEditingController monthController;
  final TextEditingController cvvController;

  CreditDebitDetail(
      {Key? key,
      required this.cardNoController,
      required this.cvvController,
      required this.onCardNo,
      required this.monthController,
      required this.onChangedCVV,
      required this.onChangedValidMonth,
      required this.is_checked,
      required this.onCheckSelected})
      : super(key: key);

  @override
  State<CreditDebitDetail> createState() => _CreditDebitDetailState();
}

class _CreditDebitDetailState extends State<CreditDebitDetail> {
  FocusNode _focusNode1 = FocusNode();

  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  bool isinfo = false;
  bool cardEditingComplete = false;
  bool monthEditingComplete = false;
  bool cvvEditingComplete = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  FaIcon? icon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenSize.width,
              child: CustomTextField(
                //maxLengthEnforcement: MaxLengthEnforcement.enforced,
                type: TextInputType.number,
                inputFormat: [
                  new LengthLimitingTextInputFormatter(19),
                  CreditCardNumberInputFormatter()
                ],
                focusNode: _focusNode1,
                controller: widget.cardNoController,
                onTap: () {
                  _focusNode1.requestFocus();
                },
                suffix: icon,
                labelText: 'Card Number *',
                completeEditing: cardEditingComplete,
                onChanged: (val) {
                  setState(() {
                    if (detectCCType(val) == CreditCardType.visa) {
                      icon = FaIcon(FontAwesomeIcons.ccVisa);
                    } else if (detectCCType(val) == CreditCardType.mastercard) {
                      icon = FaIcon(FontAwesomeIcons.ccMastercard);
                    }
                  });
                },
                onEditingCompleted: () {},
                onsubmitted: (val) {
                  setState(() {
                    _focusNode1.unfocus();
                    cardEditingComplete = true;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        focusNode: _focusNode2,
                        controller: widget.monthController,
                        type: TextInputType.number,
                        inputFormat: [
                          CreditCardExpirationDateFormatter(),
                        ],
                        onTap: () {
                          _focusNode2.requestFocus();
                        },
                        labelText: 'Valid Thru (MM/YY) *',
                        completeEditing: monthEditingComplete,
                        onChanged: widget.onChangedValidMonth,
                        onEditingCompleted: () {},
                        onsubmitted: (val) {
                          setState(() {
                            _focusNode2.unfocus();
                            monthEditingComplete = true;
                          });
                        },
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      focusNode: _focusNode3,
                      controller: widget.cvvController,
                      obsecureText: true,
                      onTap: () {
                        _focusNode3.requestFocus();
                      },
                      type: TextInputType.number,
                      inputFormat: [
                        new LengthLimitingTextInputFormatter(3),
                        CreditCardCvcInputFormatter(),
                      ],
                      suffixboxConstraints: BoxConstraints.tight(Size(17, 25)),
                      labelText: 'CVV *',
                      completeEditing: cvvEditingComplete,
                      onChanged: widget.onChangedCVV,
                      onEditingCompleted: () {},
                      onsubmitted: (val) {
                        setState(() {
                          _focusNode3.unfocus();
                          cvvEditingComplete = true;
                        });
                      },
                      suffix: Transform.translate(
                        offset: Offset(-10, 0),
                        child: InkWell(
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: bluegradientstartColor,
                            size: 17,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 500,
                                    padding: EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15, right: 15),
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
                                                      end:
                                                          Alignment.bottomLeft),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "What is CVV number ?",
                                                      style: TextStyle(
                                                          color: darkGreyColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'helvetica'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                child: Text(
                                                  "A 3-digit number printed to the right of signature strip on the back of your MasterCard / Visa Card",
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Helvetica"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                child: Text(
                                                  "A 4-digit number printed just above the account number on the front of your AMEX card",
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Helvetica"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Image(
                                                  image: AssetImage(
                                                      "assets/images/cvv.png"),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          right: 0,
                                          left: 0,
                                          child: CustomBottomBarButton(
                                            isDisable: false,
                                            height: 50,
                                            onpress: () {
                                              Navigator.of(context).pop();
                                            },
                                            title: "Okay, got it!",
                                            width: screenSize.width,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenSize.width,
              child: Row(
                children: [
                  Container(
                    child: InkWell(
                        child: widget.is_checked
                            ? GradientIcon(
                                child: FaIcon(
                                FontAwesomeIcons.solidCheckSquare,
                                size: 20,
                              ))
                            : GradientIcon(
                                child: FaIcon(
                                FontAwesomeIcons.square,
                                size: 20,
                              )),
                        onTap: widget.onCheckSelected),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    child: Text(
                      "Save this card for future payments",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Helvetica"),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: bluegradientstartColor,
                      size: 17,
                    ),
                    onTap: () {
                      setState(() {
                        isinfo = !isinfo;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: isinfo,
              child: Container(
                child: Text(
                  "Your credit / Debit card information will be encrypted and we do not store CVV number.",
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontFamily: "Helvetica"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
