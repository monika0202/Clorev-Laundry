import 'dart:convert';

import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/screens/MainScreenPage.dart';
import 'package:flutter_test_app/screens/homeScreen.dart';
import 'package:geocoder2/geocoder2.dart' as geo;
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomRadioList.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/modals/address.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

//import 'package:google_maps_webservice/directions.dart';
//import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/staticmap.dart';
import 'package:google_maps_webservice/timezone.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'dart:async';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  Completer<GoogleMapController> _mapController = Completer();
  bool popMessage = true;

  bool isSelectedAddress = false;
  var uuid = new Uuid();
  String _sessionToken = "";
  List<dynamic> _placeList = [];

  TextEditingController _controller = TextEditingController();
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  LatLng taplocation = LatLng(27.6602292, 85.308027);
  bool isSelected = false;
  String googleApikey = "AIzaSyA6q3Kd-rupAD-cieBCxwRhmx69FtR_cCg";
  String tapAddress = "";
  void _onMapCreated(GoogleMapController controller) async {
    _mapController.complete(controller);
    if ([29.196722308032882, 77.95953489840029] != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = LatLng(29.196722308032882, 77.95953489840029);
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        draggable: false,
        onTap: () async {
          // List<Placemark> placemarks =
          //     await placemarkFromCoordinates(taplocation);
        },
        onDragEnd: (val) {
          setState(() {
            popMessage = true;
          });
        },
      );
      setState(() {
        _markers[markerId] = marker;
      });

      Future.delayed(Duration(seconds: 1), () async {
        GoogleMapController controller = await _mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 15,
            ),
          ),
        );
      });
    }
  }

  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
  }

  List<Address> address = [
    Address(
      flat_House_No: "1C,21",
      location: "Sector-2,Gole Market,New Delhi-110 001",
      landmark: "Peshwa Road",
      tag_address: "Home",
      isAdded: false,
    ),
    Address(
      flat_House_No: "31, 2nd Floor",
      location: "Sant Nagar, East of Kailash, New Delhi-110 065",
      landmark: "Kailash Colony Metro Station",
      tag_address: "Office",
      isAdded: false,
    ),
    Address(
      flat_House_No: "31, 2nd Floor",
      location: "Sant Nagar, East of Kailash, New Delhi-110 065",
      landmark: "Kailash Colony Metro Station",
      tag_address: "Home",
      isAdded: false,
    ),
    Address(
      flat_House_No: "31, 2nd Floor",
      location: "Sant Nagar, East of Kailash, New Delhi-110 065",
      landmark: "Kailash Colony Metro Station",
      tag_address: "Other",
      isAdded: false,
    ),
  ];
  late int value = -1;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final top = screenSize.height / 5;
    final left = screenSize.width / 5.2;
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.48,
                      child: GoogleMap(
                        markers: Set<Marker>.of(_markers.values),
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(29.196722308032882, 77.95953489840029),
                          zoom: 10,
                        ),
                        onTap: (val) async {
                          taplocation = val;
                          print(taplocation);

                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                  taplocation.latitude, taplocation.longitude);
                          print(placemarks);
                          setState(() {
                            tapAddress = "${placemarks.first}";
                          });
                        },
                        myLocationEnabled: true,
                        onCameraIdle: () {
                          setState(() {
                            popMessage = true;
                          });
                        },
                        onCameraMove: (CameraPosition position) {
                          if (_markers.length > 0) {
                            MarkerId markerId = MarkerId(_markerIdVal());
                            Marker? marker = _markers[markerId];
                            Marker updatedMarker = marker!.copyWith(
                              positionParam: position.target,
                            );

                            setState(() {
                              _markers[markerId] = updatedMarker;
                              popMessage = false;
                            });
                          }
                        },
                      ),
                    )),
                Visibility(
                  visible: popMessage,
                  child: Positioned(
                    top: top,
                    left: left,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: FittedBox(
                            child: Column(
                              children: [
                                GradientText(
                                  title: "Your laundry will be picked-up here",
                                  isbold: true,
                                  textSize: 14,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Please move the map to adjust your location",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Helvetica',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: TriangleClipper(),
                          child: Container(
                            height: 20,
                            width: 40,
                            color: Colors.black.withOpacity(0.7),
                            child: Center(child: Text(" ")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                        height: _placeList.length == 0
                            ? 275
                            : screenSize.height / 1.5,
                        width: screenSize.width,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                              // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15, right: 16),
                                    child: Row(
                                      children: [
                                        GradientIcon(
                                            child: Icon(Icons.my_location)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        GradientText(
                                          title: "Use Current Location",
                                          textSize: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    width: screenSize.width,
                                    child: TextFormField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.location_on_rounded),
                                        labelStyle: TextStyle(
                                            color: bluegradientstartColor),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: bluegradientstartColor,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: bluegradientstartColor,
                                              width: 1),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: bluegradientstartColor,
                                                width: 1)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: bluegradientstartColor,
                                                width: 1)),

                                        //prefix: countryDropDown,
                                        hintText: 'Search Your Location',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      onChanged: (val) async {},
                                      onFieldSubmitted: (value) async {
                                        print("hello");
                                        List locations =
                                            await locationFromAddress(value);
                                        String lo = locations[0].toString();

                                        // Map m = locations.asMap();
                                        // print(locations);
                                        // print(m[0]);

                                        // print(locations.asMap());

                                        // print(m[0]);
                                        List<String> str = lo.split(",");
                                        List<String> lat = str[0].split(":");
                                        List<String> long = str[1].split(":");
                                        print(str);

                                        LatLng position = LatLng(
                                            double.parse(lat[1]),
                                            double.parse(long[1]));

                                        Future.delayed(Duration(seconds: 1),
                                            () async {
                                          GoogleMapController controller =
                                              await _mapController.future;
                                          controller.animateCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                target: position,
                                                zoom: 15,
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                  Visibility(
                                    visible: _placeList.length != 0,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _placeList.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              _placeList[index]["description"]),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomBottomBarButton(
                                    isDisable: false,
                                    width: screenSize.width,
                                    isShadow: false,
                                    onpress: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: HomePage()));
                                    },
                                    title: "CONFIRM PICK-UP LOCATION",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("or"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: CustomBottomBarButton(
                                isDisable: false,
                                isShadow: false,
                                width: screenSize.width,
                                onpress: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                    context: context,
                                    builder: (
                                      BuildContext context,
                                    ) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context, setState) {
                                        return Container(
                                          height: screenSize.height * 0.6,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                  // changes position of shadow
                                                )
                                              ]),
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    child: Container(
                                                      width: screenSize.width,
                                                      height: 45,
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          right: 15,
                                                          top: 15),
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 2,
                                                              blurRadius: 7,
                                                              offset: Offset(0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                          border: Border.all(
                                                              color:
                                                                  bluegradientstartColor,
                                                              width: 2),
                                                          color: whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GradientIcon(
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "Add New Address",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            address.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            child:
                                                                CustomRadioList(
                                                                    value:
                                                                        index,
                                                                    groupValue:
                                                                        value,
                                                                    onChanged:
                                                                        (val) {
                                                                      setState(
                                                                          () {
                                                                        value =
                                                                            val;
                                                                        isSelectedAddress =
                                                                            true;

                                                                        addressList
                                                                            .flat_House_No = address[
                                                                                value]
                                                                            .flat_House_No;
                                                                        addressList
                                                                            .landmark = address[
                                                                                value]
                                                                            .landmark;
                                                                        addressList
                                                                            .location = address[
                                                                                value]
                                                                            .location;
                                                                        addressList
                                                                            .tag_address = address[
                                                                                value]
                                                                            .tag_address;

                                                                        isSelected =
                                                                            true;
                                                                      });
                                                                    },
                                                                    flat_no: address[
                                                                            index]
                                                                        .flat_House_No,
                                                                    location: address[
                                                                            index]
                                                                        .location,
                                                                    landmark:
                                                                        address[index]
                                                                            .landmark,
                                                                    tag_address:
                                                                        address[index]
                                                                            .tag_address,
                                                                    isSelected:
                                                                        address[index]
                                                                            .isAdded),
                                                            onTap: () {
                                                              setState(() {
                                                                // address[index]
                                                                //         .isAdded =
                                                                //     !address[
                                                                //             index]
                                                                //         .isAdded;

                                                                // addressList.landmark=
                                                              });
                                                            },
                                                          );
                                                        }),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                  bottom: 20,
                                                  right: 0,
                                                  left: 0,
                                                  child: CustomBottomBarButton(
                                                    isDisable:
                                                        isSelectedAddress ==
                                                            false,
                                                    onpress: () {
                                                      if (isSelectedAddress) {
                                                        Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              type: PageTransitionType
                                                                  .rightToLeft,
                                                              child:
                                                                  MainScreenPage()),
                                                        );
                                                      }
                                                    },
                                                    width: screenSize.width,
                                                    title:
                                                        "SELECT THIS ADDRESS",
                                                  ))
                                            ],
                                          ),
                                        );
                                      });
                                    },
                                  );
                                },
                                title: "SELECT SAVED ADDRESS",
                              ),
                            ),
                          ],
                        )))
              ],
            )));
  }
}
