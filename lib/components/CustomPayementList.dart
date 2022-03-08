import 'package:flutter/material.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class SavedCardList extends StatelessWidget {
  final int groupValue;
  final String bankName;
  final String cardType;
  final int cardNo;
  final onChanged;
  final int Value;
  final bool isSelected;
  const SavedCardList(
      {Key? key,
      required this.groupValue,
      required this.onChanged,
      required this.Value,
      required this.bankName,
      required this.cardType,
      required this.cardNo,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bluegradientstartColor;
    return Container(
      child: RadioListTile(
        value: Value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$bankName $cardType",
                      style: TextStyle(
                        // color: Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "$cardNo",
                      style: TextStyle(
                        //  color: Colors.black,
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(),
              Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff00cefb), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: 13,
                      ),
                      hintText: "CVV",
                      hintStyle: TextStyle(//color: Colors.grey[500]!
                          ),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
