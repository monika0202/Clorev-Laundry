import 'package:flutter_test_app/modals/bankDetails.dart';

class ServiceProviderUser {
  String name;
  String designation;
  int mobileNumber;
  String emailID;
  String address1;
  String address2;
  String landmark;
  String? alternateMobileNo;
  BusinessInformation businessInformation;
  BankDetails bankDetails;
  List<String> serviceoffered;
  bool? expressDelivery;
  String? weeklyOff;

  ServiceProviderUser({
    required this.name,
    required this.designation,
    required this.mobileNumber,
    required this.emailID,
    this.alternateMobileNo,
    required this.address1,
    required this.address2,
    required this.landmark,
    required this.businessInformation,
    required this.bankDetails,
    required this.serviceoffered,
    this.expressDelivery,
    this.weeklyOff,
  });

  ServiceProviderUser.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        designation = json['designation'],
        mobileNumber = json['mobileNumber'],
        emailID = json['emailID'],
        alternateMobileNo = json['alternateMobileNo'],
        address1 = json['address1'],
        address2 = json['address2'],
        landmark = json['landmark'],
        expressDelivery = json['expressDelivery'],
        weeklyOff = json['weeklyOff'],
        serviceoffered = json['serviceoffered'],
        businessInformation =
            BusinessInformation.fromJson(json["buisnessInfromation"]),
        bankDetails = BankDetails.fromJson(json["bankDetails"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['mobileNumber'] = this.mobileNumber;
    data['emailID'] = this.emailID;

    data['alternateMobileNo'] = this.alternateMobileNo;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['landmark'] = this.landmark;
    data['expressDelivery'] = this.expressDelivery;
    data['weeklyOff'] = this.weeklyOff;
    data['serviceoffered'] = this.serviceoffered;

    data['buisnessInfromation'] = this.businessInformation.toJson();
    data['bankDetails'] = this.bankDetails.toJson();

    return data;
  }
}

class BusinessInformation {
  String shopName;
  String GSTIN;
  String panNo;
  String? msmeNo;

  BusinessInformation({
    required this.shopName,
    required this.GSTIN,
    required this.panNo,
    required this.msmeNo,
  });

  BusinessInformation.fromJson(Map<String, dynamic> json)
      : shopName = json['shopName'],
        GSTIN = json['GSTIN'],
        panNo = json['panNo'],
        msmeNo = json['msmeNo'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopName'] = this.shopName;
    data['GSTIN'] = this.GSTIN;

    data['panNo'] = this.panNo;
    data['msmeNo'] = this.msmeNo;

    return data;
  }
}
