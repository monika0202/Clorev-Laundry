import 'package:flutter/material.dart';
import 'package:flutter_test_app/authentication/deliveryPartnerLoginPage.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/customTextField.dart';

class DeliveryPartnerBankDetails extends StatefulWidget {
  const DeliveryPartnerBankDetails({Key? key}) : super(key: key);

  @override
  _DeliveryPartnerBankDetailsState createState() =>
      _DeliveryPartnerBankDetailsState();
}

class _DeliveryPartnerBankDetailsState
    extends State<DeliveryPartnerBankDetails> {
  FocusNode _focusNodeAccountHolderName = FocusNode();
  FocusNode _focusNodeAccountNumber = FocusNode();
  FocusNode _focusNodeIfsCode = FocusNode();
  FocusNode _focusNodeBranchName = FocusNode();

  bool _isEditingCompleteAccountHolderName = true;
  bool _isEditingCompleteAccountNumber = true;
  bool _isEditingCompleteIfsCode = true;

  bool _isEditingCompleteBranchName = true;

  TextEditingController _controllerAccountHolderName = TextEditingController()
    ..text = user.bankDetails.accountHolderName;
  TextEditingController _controllerAccountNumber = TextEditingController()
    ..text = user.bankDetails.accountNo.toString();
  TextEditingController _controllerIfsCode = TextEditingController()
    ..text = user.bankDetails.IFScode;
  TextEditingController _controllerBranchName = TextEditingController()
    ..text = "XXXXXXXXXXX";

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Bank Details",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontFamily: 'helvetica'),
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
            child: Stack(fit: StackFit.expand, children: [
              SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Container(
                      height: 600,
                      padding: EdgeInsets.all(10),
                      width: screenSize.width,
                      margin: EdgeInsets.all(15),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                          key: formkey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40,
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("CRL-009(DEL)",
                                              style: TextStyle(
                                                  color: darkGreyColor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'helvetica'))
                                        ])),
                                SizedBox(height: 20),
                                Container(
                                    width: screenSize.width,
                                    child: CustomTextField(
                                        labelText: "Account Holder Name *",
                                        completeEditing:
                                            _isEditingCompleteAccountHolderName,
                                        focusNode: _focusNodeAccountHolderName,
                                        controller:
                                            _controllerAccountHolderName,
                                        onChanged: (val) {},
                                        onEditingCompleted: () {},
                                        onsubmitted: (val) {
                                          setState(() {
                                            _isEditingCompleteAccountHolderName =
                                                true;
                                            _focusNodeAccountHolderName
                                                .unfocus();
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            _focusNodeAccountHolderName
                                                .requestFocus();
                                          });
                                        })),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: CustomTextField(
                                        labelText: "Branch Account Name *",
                                        completeEditing:
                                            _isEditingCompleteAccountNumber,
                                        focusNode: _focusNodeAccountNumber,
                                        controller: _controllerAccountNumber,
                                        onChanged: (val) {},
                                        onEditingCompleted: () {},
                                        onsubmitted: (val) {
                                          setState(() {
                                            _isEditingCompleteAccountNumber =
                                                true;
                                            _focusNodeAccountNumber.unfocus();
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            _focusNodeAccountNumber
                                                .requestFocus();
                                          });
                                        })),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: CustomTextField(
                                        labelText: "Branch IFS Code *",
                                        completeEditing:
                                            _isEditingCompleteIfsCode,
                                        focusNode: _focusNodeIfsCode,
                                        controller: _controllerIfsCode,
                                        onChanged: (val) {},
                                        onEditingCompleted: () {},
                                        onsubmitted: (val) {
                                          setState(() {
                                            _isEditingCompleteIfsCode = true;
                                            _focusNodeIfsCode.unfocus();
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            _focusNodeIfsCode.requestFocus();
                                          });
                                        })),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: CustomTextField(
                                        labelText: "Branch Name (optional)",
                                        completeEditing:
                                            _isEditingCompleteBranchName,
                                        focusNode: _focusNodeBranchName,
                                        controller: _controllerBranchName,
                                        onChanged: (val) {},
                                        onEditingCompleted: () {},
                                        onsubmitted: (val) {
                                          setState(() {
                                            _isEditingCompleteBranchName = true;
                                            _focusNodeBranchName.unfocus();
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            _focusNodeBranchName.requestFocus();
                                          });
                                        })),
                                SizedBox(height: 15),
                                Container(
                                    child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Image of Cancelled Cheque or Passbook",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'helvetica',
                                                color: Colors.grey[500])),
                                      ]),
                                  SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.photo_album_rounded,
                                          size: 100,
                                        )
                                      ]),
                                ]))
                              ])))),
              Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                  child: Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: CustomBottomBarButton(
                        isDisable: false,
                        onpress: () {},
                        title: "SAVE DETAILS",
                      )))
            ])));
  }
}
