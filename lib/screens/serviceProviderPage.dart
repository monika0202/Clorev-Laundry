import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomAlertBox.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomPickUpDelivery.dart';
import 'package:flutter_test_app/components/CustomServiceProviderList.dart';
import 'package:flutter_test_app/components/Customtogglebutton.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/ServiceList.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';
import 'package:flutter_test_app/screens/serviceProviderDetail.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/staticmap.dart';
import 'package:google_maps_webservice/timezone.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'dart:async';

class ServiceProviderList extends StatefulWidget {
  const ServiceProviderList({Key? key}) : super(key: key);

  @override
  _ServiceProviderListState createState() => _ServiceProviderListState();
}

enum ServiceCatrogry { regular, express }
ServiceCatrogry serviceCatrogry = ServiceCatrogry.regular;

class _ServiceProviderListState extends State<ServiceProviderList> {
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  Completer<GoogleMapController> _mapController = Completer();
  bool popMessage = true;
  late GoogleMapController mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  LatLng taplocation = LatLng(27.6602292, 85.308027);
//  bool isSelected = false;
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

  bool isSelectedServiceProvider = false;
  int isSelected = -1;
  bool toggle = true;
  List<ServiceList> service = [
    ServiceList(
        title: "CRL-017 (DEL)",
        star: 3.5,
        ratings: 25,
        price: 1050,
        isAdded: false),
    ServiceList(
        title: "CRL-009 (DEL)",
        star: 4.2,
        ratings: 18,
        price: 1120,
        isAdded: false),
    ServiceList(
        title: "CRL-011 (DEL)",
        star: 4.8,
        ratings: 11,
        price: 1180,
        isAdded: false),
    ServiceList(
        title: "CRL-012 (DEL)",
        star: 5,
        ratings: 11,
        price: 1180,
        isAdded: false),
    ServiceList(
        title: "CRL-014 (DEL)",
        star: 3.5,
        ratings: 11,
        price: 1180,
        isAdded: false),
    ServiceList(
        title: "CRL-016 (DEL)",
        star: 3.8,
        ratings: 11,
        price: 1180,
        isAdded: false),
    ServiceList(
        title: "CRL-021 (DEL)",
        star: 3.9,
        ratings: 11,
        price: 1180,
        isAdded: false),
    ServiceList(
        title: "CRL-022 (DEL)",
        star: 4.4,
        ratings: 11,
        price: 1180,
        isAdded: false),
  ];

  @override
  void initState() {
    for (var i = 0; i < service.length; i++) {
      double price =
          totalPrice.toDouble() * (1 + 0.1 * (service[i].star - 3.0));

      service[i].price = price;
    }
    service.sort((a, b) => a.price.compareTo(b.price));
  }

  List<String> animalNames = ['Elephant', 'Tiger', 'Kangaroo'];
  List<String> animalFamily = ['Elephantidae', 'Panthera', 'Macropodidae'];
  List<String> animalLifeSpan = ['60-70', '8-10', '15-20'];
  List<String> animalWeight = ['2700-6000', '90-310', '47-66'];
  int selectedTile = 0;
  ScrollController _listcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
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
          title: FittedBox(
            child: Container(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BorderIcon(
                      isCompleted: true,
                      onPress: () {},
                      iconData: Icons.shopping_cart_outlined),
                  Container(
                    width: MediaQuery.of(context).size.width / 5.5,
                    child: Divider(
                      thickness: 2,
                      color: bluegradientstartColor,
                    ),
                  ),
                  //LineW
                  // DotWidget(
                  //   dashColor: blueColormedium,
                  //   dashWidth: 5,
                  //   totalWidth: MediaQuery.of(context).size.width / 5.5,
                  // ),
                  BorderIcon(
                      isCompleted: false,
                      onPress: () {},
                      iconData: Icons.storefront_outlined),
                  DotWidget(
                    dashColor: bluegradientstartColor,
                    dashWidth: 5,
                    totalWidth: MediaQuery.of(context).size.width / 5.5,
                  ),
                  BorderIcon(
                      isCompleted: false,
                      onPress: () {},
                      iconData: Icons.calendar_today_rounded),
                  DotWidget(
                    dashColor: bluegradientstartColor,
                    dashWidth: 5,
                    totalWidth: MediaQuery.of(context).size.width / 5.5,
                  ),
                  BorderIcon(
                      isCompleted: false,
                      onPress: () {},
                      iconData: Icons.send_to_mobile_rounded),
                ],
              ),
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
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Container(
                    height: screenSize.height / 2,
                    width: screenSize.width,
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
              Positioned(
                bottom: 0,
                child: Container(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: DraggableScrollableSheet(
                    initialChildSize: .5,
                    minChildSize: .5,
                    maxChildSize: .88,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        // color: Colors.lightGreen[100],

                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/bodybg.png")),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, -3),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),

                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                CusttomToggleButton(
                                  lowtoHigh: toggle,
                                  onPress: () {
                                    setState(() {
                                      toggle = !toggle;

                                      if (toggle) {
                                        service.sort((a, b) =>
                                            a.price.compareTo(b.price));
                                      } else {
                                        service.sort((a, b) =>
                                            b.price.compareTo(a.price));
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PickUpDelivery(
                                      onPress: () {
                                        setState(() {
                                          serviceCatrogry =
                                              ServiceCatrogry.regular;
                                        });
                                      },
                                      isSelected: serviceCatrogry ==
                                          ServiceCatrogry.regular,
                                      icon: AssetImage(
                                          "assets/images/delivery-regular.png"),
                                      title: "Regular",
                                      size: 50,
                                      subtitle: "(3-5 day)",
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    PickUpDelivery(
                                      onPress: () {
                                        setState(() {
                                          // _serviceCatrogry =
                                          //     ServiceCatrogry.express;
                                          serviceCatrogry !=
                                                  ServiceCatrogry.express
                                              ? showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return CustomAlertBox(
                                                        removeTitle: "CANCEL",
                                                        keepTitle: "I AGREE",
                                                        description:
                                                            "Express Delivery charge shall be additional 50%(half) of the total Cart Value.",
                                                        onPressRemove: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        onPressKeep: () {
                                                          setState(() {
                                                            serviceCatrogry =
                                                                ServiceCatrogry
                                                                    .express;
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                  })
                                              : null;
                                        });
                                      },
                                      isSelected: serviceCatrogry ==
                                          ServiceCatrogry.express,
                                      icon: AssetImage(
                                          "assets/images/delivery-express.png"),
                                      title: "Express",
                                      size: 65,
                                      subtitle: "(1-2 day)",
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: screenSize.height * 0.45,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 10),
                                      controller: _listcontroller,
                                      itemCount: service.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext contex, index) {
                                        return CustomServiceProviderList(
                                            height: 75,
                                            title: service[index].title,
                                            star:
                                                service[index].star.toString(),
                                            rating: service[index]
                                                .ratings
                                                .toString(),
                                            price: service[index]
                                                .price
                                                .toStringAsFixed(1),
                                            isSelected: isSelected == index,
                                            onpress: () {
                                              setState(() {
                                                String p = service[index]
                                                    .price
                                                    .toStringAsFixed(1);
                                                isSelected = index;

                                                serviceList.title =
                                                    service[index].title;
                                                serviceList.star =
                                                    service[index].star;
                                                serviceList.ratings =
                                                    service[index].ratings;
                                                serviceList.price =
                                                    double.parse(p);
                                                isSelectedServiceProvider =
                                                    true;
                                                print(serviceList.title);
                                              });
                                            });
                                      }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                isSelectedServiceProvider
                                    ? ServiceProviderDetail(
                                        CRBNo: serviceList.title,
                                        rating: serviceList.star,
                                        totalRatingNo: serviceList.ratings,
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: CustomBottomBarButton(
                    isDisable: isSelectedServiceProvider == false,
                    onpress: () {
                      if (isSelectedServiceProvider) {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: PickUpPage()),
                        );
                      }
                    },
                    title: "CHOOSE SERVICE PROVIDER",
                  ))
            ],
          ),
        ));
  }
}
