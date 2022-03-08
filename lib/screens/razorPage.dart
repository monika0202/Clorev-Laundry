import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class RazorPayPage extends StatefulWidget {
  final String price;
  const RazorPayPage({Key? key, required this.price}) : super(key: key);

  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  @override
  Widget build(BuildContext context) {
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
            title: Text("RazorPay")),
        body: Center(
          child: Container(
              child: Text(
            "${widget.price}",
            style: TextStyle(fontSize: 20),
          )),
        ));
  }
}
