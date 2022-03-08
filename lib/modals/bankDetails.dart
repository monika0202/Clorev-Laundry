class BankDetails {
  String accountHolderName;
  int accountNo;
  String IFScode;

  BankDetails({
    required this.accountHolderName,
    required this.accountNo,
    required this.IFScode,
  });

  BankDetails.fromJson(Map<String, dynamic> json)
      : accountHolderName = json['accountHolderName'],
        accountNo = json['accountNo'],
        IFScode = json['IFScode'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['accountHolderName'] = this.accountHolderName;
    data['accountNo'] = this.accountNo;
    data['IFScode'] = this.IFScode;
    return data;
  }
}
