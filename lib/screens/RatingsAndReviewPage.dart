import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomReviewDetail.dart';
import 'package:flutter_test_app/modals/review.dart';

class RatingAndReviewPage extends StatefulWidget {
  const RatingAndReviewPage({Key? key}) : super(key: key);

  @override
  _RatingAndReviewPageState createState() => _RatingAndReviewPageState();
}

class _RatingAndReviewPageState extends State<RatingAndReviewPage> {
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
        CRLNo: "CRL-009 (DEL)",
        CRBNo: "CRB200921113",
        reply:
            "Dear consumer, thank you for taking time to share your feedback.We are glad that you chose our service and we look forward to serve you again soon",
        Comment:
            "I was very much impressed by the service quality.I always expect on-time pickup & delivery and they stood by it.Icouldn't find a single reason to rate them a lower star")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ratings & Reviews",
            style: TextStyle(
                fontFamily: 'helvetica', fontWeight: FontWeight.bold)),
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
              fit: BoxFit.fill, image: AssetImage("assets/images/bodybg.png")),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              shrinkWrap: true,
              itemCount: _review.length,
              itemBuilder: (context, index) {
                return ReviewDetail(
                    reviewDetail: _review[index].Comment,
                    name: _review[index].CRLNo,
                    CRBno: _review[index].CRBNo,
                    reply: _review[index].reply,
                    rating: 5,
                    height: 200,
                    viewReply: _review[index].viewReply,
                    isReviewPage: true,
                    onPress: () {
                      setState(() {
                        _review[index].viewReply = !_review[index].viewReply;
                      });
                    });
              }),
        ),
      ),
    );
  }
}
