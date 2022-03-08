import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter_test_app/screens/editPage.dart';
import 'package:page_transition/page_transition.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  int initialDateindex = 0;
  String initialmonth = "Jan";
  int initialyear = 1900;
  @override
  void initState() {
    for (var i = 1900; i <= 2022; i++) {
      year.add(i);
    }
  }

  List<Widget> _buildItems1() {
    return date
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  List date = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];

  List<String> month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<int> year = [];
  TextEditingController _date = TextEditingController();
  TextEditingController _month = TextEditingController();
  TextEditingController _year = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 45,
                  child: DirectSelect(
                      itemExtent: 45.0,
                      selectedIndex: initialDateindex,
                      child: MySelectionItem(
                        isForList: false,
                        title: date[initialDateindex],
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          initialDateindex = index!;
                          print("hello");
                          print(initialDateindex);
                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: ProfileEditPage()),
                          );
                        });
                      },
                      mode: DirectSelectMode.tap,
                      items: _buildItems1()),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Transform.translate(
              offset: Offset(0, 0),
              child: Container(
                height: 30,
                width: 1,
                color: Colors.grey[500],
              )),
          SizedBox(
            width: 9,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  focusColor: bluegradientstartColor,
                  value: initialmonth,
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  items: month.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      initialmonth = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: 9,
          ),
          Transform.translate(
              offset: Offset(0, 0),
              child: Container(
                height: 30,
                width: 1,
                color: Colors.grey[500],
              )),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<int>(
                  focusColor: bluegradientstartColor,
                  value: initialyear,
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  items: year.map((int items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text("$items"),
                    );
                  }).toList(),
                  onChanged: (int? val) {
                    setState(() {
                      initialyear = val!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final String? title;
  final bool isForList;

  const MySelectionItem({Key? key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down_rounded),
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        title!,
      )),
    );
  }
}
