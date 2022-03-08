import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Settings",
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
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 50,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Get updates on WhatsApp",
                          style: TextStyle(
                              color: darkGreyColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica'),
                        ),
                        Switcher(
                          value: true,
                          size: SwitcherSize.medium,
                          switcherButtonRadius: 50,
                          enabledSwitcherButtonRotate: true,
                          iconOff: Icons.clear_rounded,
                          iconOn: Icons.check_rounded,
                          colorOff: Colors.grey[300]!,
                          colorOn: bluegradientstartColor,
                          onChanged: (bool state) {
                            //
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 50,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GradientIcon(
                                child: FaIcon(FontAwesomeIcons.fingerprint)),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Touch ID",
                              style: TextStyle(
                                  color: darkGreyColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'helvetica'),
                            ),
                          ],
                        ),
                        Switcher(
                          value: false,
                          size: SwitcherSize.medium,
                          switcherButtonRadius: 50,
                          enabledSwitcherButtonRotate: true,
                          iconOff: Icons.clear_rounded,
                          iconOn: Icons.check_rounded,
                          colorOff: Colors.grey[300]!,
                          colorOn: bluegradientstartColor,
                          onChanged: (bool state) {
                            //
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
