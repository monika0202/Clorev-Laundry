import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/customTextField.dart';

class CustomVerification extends StatelessWidget {
  final String name;
  final String status;
  final Widget detail;
  final TextEditingController? controller;
  final Function(String) onchanged;
  final VoidCallback onCallPress;
  final Function(String) onSubmitting;
  final VoidCallback onCompleteEditing;
  final VoidCallback onTap;
  bool competed;
  FocusNode? focusNode;
  final VoidCallback onVerifyPress;
  bool isPickUpBoy;
  bool isDisableCall;

  CustomVerification(
      {Key? key,
      required this.name,
      required this.status,
      required this.detail,
      required this.onCallPress,
      required this.onTap,
      required this.onVerifyPress,
      required this.onchanged,
      this.focusNode,
      required this.onSubmitting,
      required this.onCompleteEditing,
      this.isPickUpBoy = true,
      this.isDisableCall = false,
      this.competed = false,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: screenSize.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Icon(Icons.person, size: 35)]),
                      SizedBox(width: 5),
                      Container(
                          width: screenSize.width - 185,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "$name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica',
                                  ),
                                ),
                                Text("$status",
                                    maxLines: 3,
                                    style: TextStyle(fontFamily: 'helvetica'))
                              ]))
                    ])),
                LoginButtons(
                  height: 35,
                  width: 80,
                  icon: Icons.call_rounded,
                  isDisable: isDisableCall,
                  onpress: onCallPress,
                  isLoginButton: true,
                  isShadow: false,
                  title: "Call",
                  isrounded: true,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(child: detail),
          isPickUpBoy
              ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: screenSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenSize.width - 200,
                            child: CustomTextField(
                                focusNode: focusNode!,
                                type: TextInputType.number,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                inputFormat: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                controller: controller!,
                                labelText: "Enter OTP",
                                onChanged: onchanged,
                                onsubmitted: onSubmitting,
                                completeEditing: competed,
                                onEditingCompleted: onCompleteEditing,
                                onTap: onTap),
                          ),
                          LoginButtons(
                            width: 130,
                            height: 45,
                            isDisable: false,
                            onpress: onVerifyPress,
                            isLoginButton: false,
                            title: "Verify",
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
