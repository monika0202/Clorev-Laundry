import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';

class CustomServiceProviderList extends StatelessWidget {
  final String title;
  final String star;
  final String rating;
  final String price;
  final VoidCallback onpress;
  final double height;
  bool isSelected;
  CustomServiceProviderList({
    Key? key,
    required this.title,
    required this.star,
    required this.rating,
    required this.price,
    this.height = 45,
    required this.onpress,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 10,
        ),
        width: MediaQuery.of(context).size.width / 2.4,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: isSelected
              ? LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          border: isSelected
              ? null
              : Border.all(color: bluegradientstartColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isSelected
                ? Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.storefront_outlined,
                      color: whiteColor,
                      size: 50,
                    ),
                  )
                : Flexible(
                    flex: 1,
                    child: GradientIcon(
                        child: Icon(
                      Icons.storefront_outlined,
                      size: 50,
                    )),
                  ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      iswhiteColor: isSelected,
                      title: title,
                      textSize: 16,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              isSelected
                                  ? Icon(
                                      Icons.star_rate_rounded,
                                      size: 17,
                                      color: Colors.white,
                                    )
                                  : GradientIcon(
                                      child: Icon(
                                        Icons.star_rate_rounded,
                                        size: 17,
                                      ),
                                    ),
                              GradientText(
                                title: star,
                                iswhiteColor: isSelected,
                                isbold: false,
                              ),
                            ],
                          )),
                          GradientText(
                            title: "($rating Ratings)",
                            iswhiteColor: isSelected,
                            isbold: false,
                          ),
                          GradientText(
                            title: "\₹$price",
                            iswhiteColor: isSelected,
                            isbold: false,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: onpress,
    );
  }
}
