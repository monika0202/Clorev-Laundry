import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomReviewDetail.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/components/customRatingBox.dart';
import 'package:flutter_test_app/modals/review.dart';
import 'package:flutter_test_app/screens/bookingSummaryPage.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';
import 'package:page_transition/page_transition.dart';

class ServiceProviderDetail extends StatefulWidget {
  final String CRBNo;
  final double rating;
  final int totalRatingNo;
  const ServiceProviderDetail({
    Key? key,
    required this.CRBNo,
    required this.rating,
    required this.totalRatingNo,
  }) : super(key: key);

  @override
  _ServiceProviderDetailState createState() => _ServiceProviderDetailState();
}

class _ServiceProviderDetailState extends State<ServiceProviderDetail> {
  List<Review> _review = [
    Review(
        name: "Sudhir Mishra",
        CRLNo: "CRL-009 (DEL)",
        CRBNo: "CRB200921113",
        viewReply: false,
        reply:
            "Dear consumer, thank you for taking time to share your feedback.We are glad that you chose our service and we look forward to serve you again soon",
        Comment:
            "I was very much impressed by the service quality.I always expect on-time pickup & delivery and they stood by it.Icouldn't find a single reason to rate them a lower star"),
    Review(
        viewReply: false,
        name: "Sudhir Mishra",
        CRLNo: "CRL-002 (DEL)",
        CRBNo: "CRB200921113",
        reply:
            "Dear consumer, thank you for taking time to share your feedback.We are glad that you chose our service and we look forward to serve you again soon",
        Comment:
            "I was very much impressed by the service quality.I always expect on-time pickup & delivery and they stood by it.Icouldn't find a single reason to rate them a lower star"),
    Review(
        viewReply: false,
        name: "Sudhir Mishra",
        CRLNo: "CRL-002 (DEL)",
        CRBNo: "CRB200921113",
        reply:
            "Dear consumer, thank you for taking time to share your feedback.We are glad that you chose our service and we look forward to serve you again soon",
        Comment:
            "I was very much impressed by the service quality.I always expect on-time pickup & delivery and they stood by it.Icouldn't find a single reason to rate them a lower star"),
    Review(
        viewReply: false,
        name: "Sudhir Mishra",
        CRLNo: "CRL-002 (DEL)",
        CRBNo: "CRB200921113",
        reply:
            "Dear consumer, thank you for taking time to share your feedback.We are glad that you chose our service and we look forward to serve you again soon",
        Comment:
            "I was very much impressed by the service quality.I always expect on-time pickup & delivery and they stood by it.Icouldn't find a single reason to rate them a lower star")
  ];
  bool viewReply = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height - 125,
      child: Column(
        children: [
          Container(
            child: CustomRatingBox(
                height: 130,
                name: widget.CRBNo,
                fivestar: 51,
                fourstar: 27,
                threestar: 14,
                twostar: 5,
                onestar: 3,
                totalRating: widget.rating,
                totalRatingNo: widget.totalRatingNo,
                totalReviewsNo: 11),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              height: screenSize.height - 270,
              child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 100, top: 10),
                  shrinkWrap: true,
                  itemCount: _review.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ReviewDetail(
                        reviewDetail: _review[index].Comment,
                        name: _review[index].name,
                        CRBno: _review[index].CRBNo,
                        reply: _review[index].reply,
                        rating: 5,
                        height: 200,
                        viewReply: _review[index].viewReply,
                        onPress: () {
                          setState(() {
                            _review[index].viewReply =
                                !_review[index].viewReply;
                          });
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
