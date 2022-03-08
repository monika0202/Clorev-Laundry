import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_expiration_input_formatter.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomAlertBox.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customSavedCard.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/modals/savedCardList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SavedCards extends StatefulWidget {
  const SavedCards({Key? key}) : super(key: key);

  @override
  _SavedCardsState createState() => _SavedCardsState();
}

class _SavedCardsState extends State<SavedCards> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _cardNoController = TextEditingController();

  TextEditingController _validThruController = TextEditingController();
  List<SavedCardList> _savedCardList = [
    SavedCardList(
        name: "SUDHIR MISHRA",
        bankName: "AXIS BANK",
        cardNo: "4308 XXXX XXXX 9068",
        expDate: "08/23"),
    SavedCardList(
        name: "SUDHIR MISHRA",
        bankName: "AXIS BANK",
        cardNo: "4308 XXXX XXXX 9068",
        expDate: "08/23"),
    SavedCardList(
        name: "SUDHIR MISHRA",
        bankName: "AXIS BANK",
        cardNo: "4308 XXXX XXXX 9068",
        expDate: "08/23"),
    SavedCardList(
        name: "SUDHIR MISHRA",
        bankName: "AXIS BANK",
        cardNo: "4308 XXXX XXXX 9068",
        expDate: "08/23"),
  ];
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Saved Cards",
            style:
                TextStyle(fontFamily: 'helvetica', fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.white,
              )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/bodybg.png")),
            ),
            child: Container(
                margin: EdgeInsets.only(top: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomSavedCard(
                        name: _savedCardList[index].name,
                        bankName: _savedCardList[index].bankName,
                        cardNo: _savedCardList[index].cardNo,
                        expDate: _savedCardList[index].expDate,
                        isSelected: isSelected,
                        onPressEdit: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomEditSavedCards(
                                    name: _nameController
                                      ..text = _savedCardList[index].name,
                                    cardNo: _cardNoController
                                      ..text = _savedCardList[index].cardNo,
                                    validThru: _validThruController
                                      ..text = _savedCardList[index].expDate,
                                    onPressCancel: () {
                                      Navigator.of(context).pop();
                                    },
                                    onPressSaved: () {
                                      setState(() {
                                        _savedCardList[index].expDate =
                                            _validThruController.text;
                                        Navigator.of(context).pop();
                                      });
                                    });
                              });
                        },
                        onPressRemove: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertBox(
                                  removeTitle: "REMOVE",
                                  keepTitle: "KEEP",
                                  description:
                                      "Are you sure, you want to remove ${_savedCardList[index].bankName} card ${_savedCardList[index].cardNo} ?",
                                  onPressRemove: () {
                                    setState(() {
                                      _savedCardList.removeAt(index);
                                      Navigator.of(context).pop();
                                    });

                                    this.setState(() {});
                                  },
                                  onPressKeep: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              });
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: _savedCardList.length))));
  }
}

class CustomEditSavedCards extends StatefulWidget {
  TextEditingController name;
  TextEditingController cardNo;
  TextEditingController validThru;

  final VoidCallback onPressCancel;
  final VoidCallback onPressSaved;

  CustomEditSavedCards({
    Key? key,
    required this.name,
    required this.cardNo,
    required this.validThru,
    required this.onPressCancel,
    required this.onPressSaved,
  }) : super(key: key);

  @override
  State<CustomEditSavedCards> createState() => _CustomEditSavedCardsState();
}

class _CustomEditSavedCardsState extends State<CustomEditSavedCards> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _cardNoController = TextEditingController();

  TextEditingController _validThruController = TextEditingController();

  FocusNode _focusNodeName = FocusNode();

  FocusNode _focusNodeCardNo = FocusNode();

  FocusNode _focusNodeValidThru = FocusNode();

  bool isCompleteName = true;

  bool isCompleteCardNo = true;

  bool isCompleteValidThru = true;

  @override
  void initState() {
    // TODO: implement initState

    print(widget.cardNo.text);
    _nameController = widget.name;
    _cardNoController = widget.cardNo;
    _validThruController = widget.validThru;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 0,
        right: 0,
      ),
      width: screenSize.width,
      child: AlertDialog(
        //shape: CircularRecte,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        titlePadding: EdgeInsets.only(top: 15, bottom: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientIcon(
                child: FaIcon(FontAwesomeIcons.exclamationTriangle, size: 50)),
          ],
        ),

        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
        content: Container(
          height: 165,
          child: Column(
            children: [
              CustomTextField(
                completeEditing: isCompleteName,
                controller: _nameController,
                focusNode: _focusNodeName,
                onTap: () {
                  setState(() {
                    _focusNodeName.requestFocus();
                  });
                },
                labelText: "Name *",
                onChanged: (val) {},
                onsubmitted: (val) {
                  setState(() {
                    _focusNodeName.unfocus();
                    isCompleteName = true;
                  });
                },
                onEditingCompleted: () {},
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                completeEditing: isCompleteCardNo,
                controller: _cardNoController,
                focusNode: _focusNodeCardNo,
                onTap: () {
                  setState(() {
                    _focusNodeCardNo.requestFocus();
                  });
                },
                labelText: "Card No *",
                onChanged: (val) {},
                onsubmitted: (val) {
                  setState(() {
                    _focusNodeCardNo.unfocus();
                    isCompleteCardNo = true;
                  });
                },
                onEditingCompleted: () {},
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                completeEditing: isCompleteValidThru,
                controller: _validThruController,
                focusNode: _focusNodeValidThru,
                type: TextInputType.number,
                inputFormat: [
                  CreditCardExpirationDateFormatter(),
                ],
                onTap: () {
                  setState(() {
                    _focusNodeValidThru.requestFocus();
                  });
                },
                labelText: "Valid Thru *",
                onChanged: (val) {},
                onsubmitted: (val) {
                  setState(() {
                    _focusNodeValidThru.unfocus();
                    isCompleteValidThru = true;
                  });
                },
                onEditingCompleted: () {},
              )
            ],
          ),
        ),
        actionsPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 0),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          InkWell(
            onTap: widget.onPressCancel,
            child: Container(
                alignment: Alignment.center,
                width: 130,
                height: 35,
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: bluegradientstartColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GradientText(
                  title: "CANCEL",
                  textSize: 17,
                  isbold: true,
                )),
          ),
          InkWell(
            onTap: widget.onPressSaved,
            child: Container(
                width: 130,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: containerGradient,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "SAVED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'helvetica',
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
