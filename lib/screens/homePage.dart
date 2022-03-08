import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomBottomBar.dart';
import 'package:flutter_test_app/components/CustomDropDownTile.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientCardBox.dart';
import 'package:flutter_test_app/components/customDropDownItem.dart';
import 'package:flutter_test_app/components/customSearchBox.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/AddOnCategory.dart';
import 'package:flutter_test_app/modals/AddToCart.dart';
import 'package:flutter_test_app/modals/BrandCategory.dart';
import 'package:flutter_test_app/components/CustomAddOn.dart';
import 'package:flutter_test_app/components/CustomPopUp.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';
import 'package:flutter_test_app/screens/search.dart';
import 'package:flutter_test_app/screens/serviceProviderPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:textfield_search/textfield_search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

enum PeopleCatrogry { Men, Women, Kids, Household }
enum LaundryCategory { laundry, dryCleaning, streamPress, leathercare }
enum ClothingCategory { DailyWear, EthnicWear, WinterWear, nothingSelected }

int totalItems = 0;
int totalPrice = 0;
List<AddToCart> addCart = [];

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  bool isCompleted = false;
  ClothingCategory _clothingCategory = ClothingCategory.nothingSelected;
  LaundryCategory _laundryCategory = LaundryCategory.dryCleaning;
  PeopleCatrogry _peopleCatrogry = PeopleCatrogry.Men;

  void toastMessageShort({String message = "default message"}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey[400],
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  List<AddOnCatgory> addOnItems = [
    AddOnCatgory(
        productId: 1,
        name: "Disinfectant",
        description: "protection against pathogens",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 2,
        name: "Softener",
        description: "long-life of garments and cosy touch",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 3,
        name: "Starch Treatment",
        description: "for Cotten & Linen items",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 4,
        name: "Organic Detergent",
        description: "extra-care of skin",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 5,
        name: "Stain Removal",
        description: "per spot",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 6,
        name: "Darning",
        description: "small hole,cut or tear",
        price: 00.00,
        isAdded: false,
        quantity: 1),
  ];
  List<BrandCatgory> menuItems = [
    BrandCatgory(
        category: "laundry",
        type: "Women",
        productId: 1,
        name: "T-shirt 1",
        sellingPrice: 10.00,
        isAdded: false,
        mrp: 20.00,
        quantity: 1),
    BrandCatgory(
        category: "dryCleaning",
        type: "Women",
        productId: 2,
        name: "T-shirt 2",
        sellingPrice: 15.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Men",
        category: "dryCleaning",
        productId: 3,
        name: "T-shirt 3",
        sellingPrice: 20.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Men",
        category: "laundry",
        productId: 4,
        name: "T-shirt 4",
        sellingPrice: 15.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Women",
        category: "laundry",
        productId: 5,
        name: "T-shirt 5",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
  ];
  List<BrandCatgory> menuItems2 = [
    BrandCatgory(
        type: "Men",
        category: "dryCleaning",
        productId: 1,
        name: "Ehtnic item 1",
        sellingPrice: 10.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Kid",
        category: "dryCleaning",
        productId: 2,
        name: "Ehtnic item 2",
        sellingPrice: 15.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Household",
        category: "leadthercare",
        productId: 3,
        name: "Ehtnic item 3",
        sellingPrice: 20.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Women",
        category: "laundry",
        productId: 4,
        name: "Ehtnic item 4",
        sellingPrice: 15.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Women",
        category: "laundry",
        productId: 5,
        name: "Ehtnic item 5",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
  ];
  List<BrandCatgory> menuItems3 = [
    BrandCatgory(
        type: "Men",
        category: "dryCleaning",
        productId: 1,
        name: "Winter Item 1",
        sellingPrice: 10.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Men",
        category: "dryCleaning",
        productId: 2,
        name: "Winter Item 2",
        sellingPrice: 15.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        category: "laundry",
        type: "Men",
        productId: 3,
        name: "Winter Item 3",
        sellingPrice: 20.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        category: "laundry",
        type: "Kid",
        productId: 4,
        name: "Winter Item 4",
        sellingPrice: 15.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Men",
        category: "laundry",
        productId: 5,
        name: "Winter Item 5",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Men",
        category: "laundry",
        productId: 6,
        name: "Winter Item 6",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Kid",
        category: "laundry",
        productId: 7,
        name: "Winter Item 7",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Women",
        category: "laundry",
        productId: 8,
        name: "Winter Item 8",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        type: "Women",
        category: "laundry",
        productId: 9,
        name: "Winter Item 9",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
    BrandCatgory(
        category: "DryCleaning",
        type: "Men",
        productId: 10,
        name: "Winter Item 10",
        sellingPrice: 30.00,
        mrp: 10.00,
        isAdded: false,
        quantity: 1),
  ];

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
              Navigator.of(context).pop(); //   log("back button");
              //   toastMessageShort(message: "Back Button Pressed");
            },
            icon: FaIcon(
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
                    isCompleted: false,
                    onPress: () {},
                    iconData: Icons.shopping_cart_outlined),
                DotWidget(
                  dashColor: bluegradientstartColor,
                  dashWidth: 5,
                  totalWidth: MediaQuery.of(context).size.width / 5.5,
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
              fit: BoxFit.fill, image: AssetImage("assets/images/bodybg.png")),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GradientCardBox(
                          title: "Laundry\nWash & Iron",
                          onPress: () {
                            setState(() {
                              _laundryCategory = LaundryCategory.laundry;
                            });
                          },
                          isSelected:
                              _laundryCategory == LaundryCategory.laundry,
                        ),
                        GradientCardBox(
                          title: "Dry-\nCleaning",
                          onPress: () {
                            setState(() {
                              _laundryCategory = LaundryCategory.dryCleaning;
                            });
                          },
                          isSelected:
                              _laundryCategory == LaundryCategory.dryCleaning,
                        ),
                        GradientCardBox(
                          title: "Steam\nPress",
                          onPress: () {
                            setState(() {
                              _laundryCategory = LaundryCategory.streamPress;
                            });
                          },
                          isSelected:
                              _laundryCategory == LaundryCategory.streamPress,
                        ),
                        GradientCardBox(
                          title: "Show &\nLeather Care",
                          onPress: () {
                            setState(() {
                              _laundryCategory = LaundryCategory.leathercare;
                            });
                          },
                          isSelected:
                              _laundryCategory == LaundryCategory.leathercare,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GradientButton(
                        width: MediaQuery.of(context).size.width / 4.5,
                        title: "WOMEN",
                        onPress: () {
                          setState(() {
                            _peopleCatrogry = PeopleCatrogry.Women;
                          });
                        },
                        isSelected: _peopleCatrogry == PeopleCatrogry.Women,
                      ),
                      GradientButton(
                        width: MediaQuery.of(context).size.width / 5.8,
                        title: "MEN",
                        onPress: () {
                          setState(() {
                            _peopleCatrogry = PeopleCatrogry.Men;
                          });
                        },
                        isSelected: _peopleCatrogry == PeopleCatrogry.Men,
                      ),
                      GradientButton(
                        width: MediaQuery.of(context).size.width / 5.8,
                        title: "KIDS",
                        onPress: () {
                          setState(() {
                            _peopleCatrogry = PeopleCatrogry.Kids;
                          });
                        },
                        isSelected: _peopleCatrogry == PeopleCatrogry.Kids,
                      ),
                      GradientButton(
                        width: MediaQuery.of(context).size.width / 3.3,
                        title: "HOUSEHOLD",
                        onPress: () {
                          setState(() {
                            _peopleCatrogry = PeopleCatrogry.Household;
                          });
                        },
                        isSelected: _peopleCatrogry == PeopleCatrogry.Household,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: screenSize.height - 390,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      // width: screenSize.width / 1.1,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        CustomSearchBox(
                            screenSize: screenSize,
                            textEditingController: _textEditingController),
                        SizedBox(
                          height: 10,
                        ),
                        CustomDropdownwithTitle(
                          screenSize: screenSize,
                          title: "Daily Wear",
                          onPress: () {
                            setState(() {
                              _clothingCategory = _clothingCategory ==
                                      ClothingCategory.DailyWear
                                  ? ClothingCategory.nothingSelected
                                  : ClothingCategory.DailyWear;
                            });
                          },
                          icon: _clothingCategory == ClothingCategory.DailyWear
                              ? Icons.arrow_drop_down_rounded
                              : Icons.arrow_right_rounded,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        _clothingCategory == ClothingCategory.DailyWear
                            ? Container(
                                height: screenSize.height / 4,
                                margin: EdgeInsets.only(left: 15, right: 15),
                                // width: screenSize.width / 1.17,
                                child: ListView.builder(
                                    //itemExtent: 50,
                                    shrinkWrap: true,
                                    itemCount: menuItems.length,
                                    itemBuilder: (context, index) {
                                      print(describeEnum(_laundryCategory));
                                      if (describeEnum(_laundryCategory) ==
                                              menuItems[index].category &&
                                          describeEnum(_peopleCatrogry) ==
                                              menuItems[index].type) {
                                        return CustomDropDownMenuItem(
                                          title: menuItems[index].name,
                                          sellingPrice: menuItems[index]
                                              .sellingPrice!
                                              .toInt()
                                              .toString(),
                                          mrp: menuItems[index].mrp.toString(),
                                          quantity: menuItems[index]
                                              .quantity
                                              .toString(),
                                          isAddedItem: menuItems[index].isAdded,
                                          onAddPress: () {
                                            setState(() {
                                              menuItems[index].quantity++;
                                              totalPrice += menuItems[index]
                                                  .sellingPrice!
                                                  .toInt();

                                              totalItems++;

                                              addCart.last.quantity =
                                                  menuItems[index].quantity;

                                              print("${addCart[0].quantity}");
                                              print(addCart.length);
                                            });
                                          },
                                          onMinusPress: () {
                                            setState(() {
                                              if (menuItems[index].quantity >
                                                  1) {
                                                menuItems[index].quantity--;
                                                totalPrice -= menuItems[index]
                                                    .sellingPrice!
                                                    .toInt();
                                                totalItems--;

                                                addCart.last.quantity =
                                                    menuItems[index].quantity;

                                                print("${addCart[0].quantity}");
                                                print(addCart.length);
                                              } else {
                                                menuItems[index].isAdded =
                                                    false;
                                                totalPrice -= menuItems[index]
                                                    .sellingPrice!
                                                    .toInt();
                                                totalItems--;

                                                addCart.removeLast();
                                                //  print("${addCart[0].quantity}");
                                                print(addCart.length);
                                              }
                                            });
                                          },
                                          onPressFirstAdd: () {
                                            setState(() {
                                              menuItems[index].isAdded =
                                                  !menuItems[index].isAdded;
                                              totalItems++;
                                              totalPrice += menuItems[index]
                                                  .sellingPrice!
                                                  .toInt();

                                              addCart.add(AddToCart(
                                                  mrp: menuItems[index].mrp,
                                                  productID: menuItems[index]
                                                      .productId,
                                                  name: menuItems[index].name,
                                                  description:
                                                      menuItems[index].type,
                                                  sellingPrice: menuItems[index]
                                                      .sellingPrice!,
                                                  quantity:
                                                      menuItems[index].quantity,
                                                  category: menuItems[index]
                                                      .category));
                                            });
                                          },
                                        );
                                      } else
                                        return Container();
                                    }),
                              )
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        CustomDropdownwithTitle(
                          screenSize: screenSize,
                          title: "Ethnic Wear",
                          onPress: () {
                            setState(() {
                              _clothingCategory = _clothingCategory ==
                                      ClothingCategory.EthnicWear
                                  ? ClothingCategory.nothingSelected
                                  : ClothingCategory.EthnicWear;
                            });
                          },
                          icon: _clothingCategory == ClothingCategory.EthnicWear
                              ? Icons.arrow_drop_down_rounded
                              : Icons.arrow_right_rounded,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        _clothingCategory == ClothingCategory.EthnicWear
                            ? Container(
                                height: screenSize.height / 4,
                                margin: EdgeInsets.only(left: 15, right: 15),
                                // width: screenSize.width / 1.17,
                                child: ListView.builder(
                                    itemCount: menuItems2.length,
                                    itemBuilder: (context, index) {
                                      if (describeEnum(_laundryCategory) ==
                                              menuItems2[index].category &&
                                          describeEnum(_peopleCatrogry) ==
                                              menuItems2[index].type) {
                                        return CustomDropDownMenuItem(
                                            title: menuItems2[index].name,
                                            sellingPrice: menuItems2[index]
                                                .sellingPrice!
                                                .toInt()
                                                .toString(),
                                            mrp: menuItems2[index]
                                                .mrp
                                                .toString(),
                                            quantity: menuItems2[index]
                                                .quantity
                                                .toString(),
                                            isAddedItem:
                                                menuItems2[index].isAdded,
                                            onAddPress: () {
                                              setState(() {
                                                menuItems2[index].quantity++;
                                                totalPrice += menuItems2[index]
                                                    .sellingPrice!
                                                    .toInt();
                                                totalItems++;
                                                addCart.last.quantity =
                                                    menuItems2[index].quantity;
                                              });
                                            },
                                            onMinusPress: () {
                                              setState(() {
                                                if (menuItems2[index].quantity >
                                                    1) {
                                                  menuItems2[index].quantity--;
                                                  totalPrice -=
                                                      menuItems2[index]
                                                          .sellingPrice!
                                                          .toInt();
                                                  totalItems--;
                                                  addCart.last.quantity =
                                                      menuItems2[index]
                                                          .quantity;
                                                } else {
                                                  menuItems2[index].isAdded =
                                                      false;
                                                  totalPrice -=
                                                      menuItems2[index]
                                                          .sellingPrice!
                                                          .toInt();
                                                  totalItems--;
                                                  addCart.removeLast();
                                                }
                                              });
                                            },
                                            onPressFirstAdd: () {
                                              setState(() {
                                                menuItems2[index].isAdded =
                                                    !menuItems2[index].isAdded;
                                                totalItems++;
                                                totalPrice += menuItems2[index]
                                                    .sellingPrice!
                                                    .toInt();

                                                addCart.add(AddToCart(
                                                    mrp: menuItems[index].mrp,
                                                    productID: menuItems2[index]
                                                        .productId,
                                                    name:
                                                        menuItems2[index].name,
                                                    description:
                                                        menuItems2[index].type,
                                                    sellingPrice:
                                                        menuItems2[index]
                                                            .sellingPrice,
                                                    quantity: menuItems2[index]
                                                        .quantity,
                                                    category: menuItems2[index]
                                                        .category));
                                              });
                                            });
                                      } else
                                        return Container();
                                    }))
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        CustomDropdownwithTitle(
                          screenSize: screenSize,
                          title: "Winter Wear",
                          onPress: () {
                            setState(() {
                              _clothingCategory = _clothingCategory ==
                                      ClothingCategory.WinterWear
                                  ? ClothingCategory.nothingSelected
                                  : ClothingCategory.WinterWear;
                            });
                          },
                          icon: _clothingCategory == ClothingCategory.WinterWear
                              ? Icons.arrow_drop_down_rounded
                              : Icons.arrow_right_rounded,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        _clothingCategory == ClothingCategory.WinterWear
                            ? Expanded(
                                child: Container(
                                    height: screenSize.height / 4,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: ListView.builder(
                                        itemCount: menuItems3.length,
                                        itemBuilder: (context, index) {
                                          if (describeEnum(_laundryCategory) ==
                                                  menuItems3[index].category &&
                                              describeEnum(_peopleCatrogry) ==
                                                  menuItems3[index].type) {
                                            return CustomDropDownMenuItem(
                                                title: menuItems3[index].name,
                                                sellingPrice: menuItems3[index]
                                                    .sellingPrice!
                                                    .toInt()
                                                    .toString(),
                                                mrp: menuItems3[index]
                                                    .mrp
                                                    .toString(),
                                                quantity: menuItems3[index]
                                                    .quantity
                                                    .toString(),
                                                isAddedItem:
                                                    menuItems3[index].isAdded,
                                                onAddPress: () {
                                                  setState(() {
                                                    menuItems3[index]
                                                        .quantity++;
                                                    totalPrice +=
                                                        menuItems3[index]
                                                            .sellingPrice!
                                                            .toInt();
                                                    totalItems++;
                                                    addCart.last.quantity =
                                                        menuItems3[index]
                                                            .quantity;
                                                  });
                                                },
                                                onMinusPress: () {
                                                  setState(() {
                                                    if (menuItems3[index]
                                                            .quantity >
                                                        1) {
                                                      menuItems3[index]
                                                          .quantity--;
                                                      totalPrice -=
                                                          menuItems3[index]
                                                              .sellingPrice!
                                                              .toInt();
                                                      totalItems--;
                                                      addCart.last.quantity =
                                                          menuItems3[index]
                                                              .quantity;
                                                    } else {
                                                      menuItems3[index]
                                                          .isAdded = false;
                                                      totalPrice -=
                                                          menuItems3[index]
                                                              .sellingPrice!
                                                              .toInt();
                                                      totalItems--;
                                                      addCart.removeLast();
                                                    }
                                                  });
                                                },
                                                onPressFirstAdd: () {
                                                  setState(() {
                                                    menuItems3[index].isAdded =
                                                        !menuItems3[index]
                                                            .isAdded;
                                                    totalItems++;
                                                    totalPrice +=
                                                        menuItems3[index]
                                                            .sellingPrice!
                                                            .toInt();

                                                    addCart.add(AddToCart(
                                                        mrp: menuItems[index]
                                                            .mrp,
                                                        productID:
                                                            menuItems3[index]
                                                                .productId,
                                                        name: menuItems3[index]
                                                            .name,
                                                        description:
                                                            menuItems3[index]
                                                                .type,
                                                        sellingPrice:
                                                            menuItems3[index]
                                                                .sellingPrice,
                                                        quantity:
                                                            menuItems3[index]
                                                                .quantity,
                                                        category:
                                                            menuItems3[index]
                                                                .category));
                                                  });
                                                });
                                          } else
                                            return Container();
                                        })))
                            : Container()
                      ])),
                  SizedBox(height: screenSize.height / 50)
                ]))),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: CustomBottomBar(
                    isDisable: totalItems == 0,
                    onpress: () {
                      print(jsonEncode(addCart));
                      totalItems != 0 && totalPrice >= 200
                          ? showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                    builder: (BuildContext context, setState) {
                                  return CustomPopUpMenu(
                                      addOnItems: addOnItems,
                                      category: "AddOn",
                                      onPress: () {
                                        print(
                                            "totalquantity : $totalItems    totalPrice :$totalPrice");
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ServiceProviderList()),
                                        );
                                      });
                                });
                              })
                          : toastMessageShort(
                              message: "Minimum Booking Value should be \₹200");
                    },
                    price: "$totalPrice",
                    quantity: totalItems.toString(),
                    screenSize: screenSize),
              ),
            ),
            //  SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
