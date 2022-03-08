import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

import 'package:image_picker/image_picker.dart';

class CustomBookingList extends StatefulWidget {
  final bool isPhotoClicked;
  final String price, title, quantity, description;
  bool isDeliveryBooking;
  CustomBookingList({
    Key? key,
    required this.description,
    required this.price,
    required this.title,
    required this.quantity,
    this.isPhotoClicked = false,
    this.isDeliveryBooking = false,
  }) : super(key: key);

  @override
  State<CustomBookingList> createState() => _CustomBookingListState();
}

class _CustomBookingListState extends State<CustomBookingList> {
  final ImagePicker _picker = ImagePicker();
//pick image from camera
  late XFile _image;
  _imgFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image!;
    });
  }

//pick image from gallery
  _imgFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -3),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          leading: Icon(
            Icons.circle,
            size: 40,
          ),
          title: Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                widget.title,
                style: TextStyle(fontFamily: 'Helvetica'),
              )),
          subtitle: Transform.translate(
              offset: Offset(-10, 0),
              child: Text("\₹${widget.price}",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                  ))),
          trailing: widget.isDeliveryBooking
              ? Transform.translate(
                  offset: Offset(10, 0),
                  child: Container(
                    width: 35,
                    child: Text(
                      "${widget.quantity}",
                      style: TextStyle(fontFamily: 'Helvetica'),
                    ),
                  ))
              : Transform.translate(
                  offset: Offset(10, 0),
                  child: Container(
                      width: 80,
                      child: Row(
                        children: [
                          Text(
                            "${widget.quantity}",
                            style: TextStyle(fontFamily: 'Helvetica'),
                          ),
                          SizedBox(width: 15),
                          widget.isPhotoClicked
                              ? Icon(
                                  Icons.image_outlined,
                                  size: 40,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 40,
                                  ),
                                  onTap: () {
                                    _imgFromCamera();
                                  },
                                ),
                        ],
                      )),
                )),
    );
  }
}
