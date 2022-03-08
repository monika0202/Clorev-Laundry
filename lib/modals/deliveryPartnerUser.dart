import 'package:flutter_test_app/modals/bankDetails.dart';

class DeliveryPartnerUser {
  String name;
  String designation;
  int mobileNumber;
  String emailID;

  String? alternateMobileNo;
  ProfessionalDetails professionalDetails;
  BankDetails bankDetails;
  List<String> preferredServiceTime;

  String? weeklyOff;
  DeliveryPartnerUser({
    required this.name,
    required this.designation,
    required this.mobileNumber,
    required this.emailID,
    this.alternateMobileNo,
    required this.professionalDetails,
    required this.bankDetails,
    required this.preferredServiceTime,
    required this.weeklyOff,
  });

  DeliveryPartnerUser.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        designation = json['designation'],
        mobileNumber = json['mobileNumber'],
        emailID = json['emailID'],
        alternateMobileNo = json['alternateMobileNo'],
        weeklyOff = json['weeklyOff'],
        preferredServiceTime = json['preferredServiceTime'],
        professionalDetails =
            ProfessionalDetails.fromJson(json["professionalDetails"]),
        bankDetails = BankDetails.fromJson(json["bankDetails"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['mobileNumber'] = this.mobileNumber;
    data['emailID'] = this.emailID;

    data['alternateMobileNo'] = this.alternateMobileNo;

    data['weeklyOff'] = this.weeklyOff;
    data['referredServiceTime'] = this.preferredServiceTime;

    data['professionalDetails'] = this.professionalDetails.toJson();
    data['bankDetails'] = this.bankDetails.toJson();

    return data;
  }
}

class ProfessionalDetails {
  int aadhaarNo;
  String drivingLicenceNo;
  String panNo;
  String? pfAccountNo;

  ProfessionalDetails({
    required this.aadhaarNo,
    required this.drivingLicenceNo,
    required this.panNo,
    this.pfAccountNo,
  });

  ProfessionalDetails.fromJson(Map<String, dynamic> json)
      : aadhaarNo = json['aadhaarNo'],
        drivingLicenceNo = json['drivingLicenceNo'],
        panNo = json['panNo'],
        pfAccountNo = json['pfAccountNo'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhaarNo'] = this.aadhaarNo;
    data['drivingLicenceNo'] = this.drivingLicenceNo;

    data['panNo'] = this.panNo;
    data['pfAccountNo'] = this.pfAccountNo;

    return data;
  }
}
