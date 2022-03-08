import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';

class CustomNotification extends StatelessWidget {
  final String date;
  final String time;
  final String content;
  final String title;
  final bool isbookmarked;
  final VoidCallback onPressBookmark;
  final VoidCallback onPressDelete;
  CustomNotification(
      {Key? key,
      required this.date,
      required this.time,
      required this.content,
      required this.onPressBookmark,
      required this.onPressDelete,
      this.isbookmarked = false,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    width: screenSize.width / 1.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          title: "$date, $time",
                          textSize: 14,
                          isbold: false,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'helvetica')),
                        Text(content,
                            maxLines: 2,
                            style: TextStyle(fontFamily: 'helvetica'))
                      ],
                    ),
                  ),
                  InkWell(
                      child: Container(
                        child: Icon(
                          isbookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: bluegradientstartColor,
                        ),
                      ),
                      onTap: onPressBookmark),
                ]),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Icon(
                    Icons.delete,
                    color: bluegradientstartColor,
                  ),
                  onTap: onPressDelete,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
