import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class PhonepeGooglepayWallet extends StatefulWidget {
  final TextEditingController UPIController;
  final VoidCallback onCheckSelected;
  final bool is_checked;

  final int groupValue;
  final onChangedUPI;
  final Function(int?) onSelectRadioButton;

  const PhonepeGooglepayWallet({
    Key? key,
    required this.UPIController,
    required this.is_checked,
    required this.onCheckSelected,
    required this.onChangedUPI,
    required this.groupValue,
    required this.onSelectRadioButton,
  }) : super(key: key);

  @override
  State<PhonepeGooglepayWallet> createState() => _PhonepeGooglepayWalletState();
}

class _PhonepeGooglepayWalletState extends State<PhonepeGooglepayWallet> {
  FocusNode _focusNode1 = FocusNode();

  bool upiIDEditingComplete = false;
  bool isinfo = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 20, right: 20),
      width: screenSize.width,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: screenSize.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioListTile<int>(
                    dense: true,
                    value: 1,
                    groupValue: widget.groupValue,
                    onChanged: widget.onSelectRadioButton,
                    activeColor: bluegradientstartColor,
                    title: Transform.translate(
                      offset: const Offset(-30, 0),
                      child: Image(
                        image: AssetImage("assets/images/Phonepe.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    dense: true,
                    value: 2,
                    groupValue: widget.groupValue,
                    onChanged: widget.onSelectRadioButton,
                    activeColor: bluegradientstartColor,
                    title: Transform.translate(
                        offset: const Offset(-30, 0),
                        child: Image(
                            image: AssetImage("assets/images/GooglePay.png"))),
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    dense: true,
                    value: 3,
                    groupValue: widget.groupValue,
                    onChanged: widget.onSelectRadioButton,
                    activeColor: bluegradientstartColor,
                    title: Transform.translate(
                        offset: const Offset(-17, 0),
                        child:
                            Image(image: AssetImage("assets/images/BHIM.png"))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              focusNode: _focusNode1,
              controller: widget.UPIController,
              labelText: "UPI ID *",
              onChanged: widget.onChangedUPI,
              onsubmitted: (val) {
                setState(() {
                  _focusNode1.unfocus();
                  upiIDEditingComplete = true;
                });
              },
              completeEditing: upiIDEditingComplete,
              onEditingCompleted: () {},
              onTap: () {}),
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
                    "Save UPI ID for future payments",
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
                "Your UPI ID information will be encrypted and we do not store MPIN",
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
    );
  }
}
