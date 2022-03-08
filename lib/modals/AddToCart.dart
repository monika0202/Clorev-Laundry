class AddToCart {
  int? productID;
  String? name;
  String? description;
  double? sellingPrice;
  double? mrp;
  int? quantity;
  String? category;

  AddToCart(
      {this.name,
      this.productID,
      this.description,
      this.sellingPrice,
      this.quantity,
      this.mrp,
      this.category});

  AddToCart.fromJson(Map<String, dynamic> json)
      : productID = json['productID'],
        name = json['name'],
        description = json['description'],
        sellingPrice = json['srllingPrice'],
        mrp = json["mrp"],
        quantity = json['quantity'],
        category = json['category'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['name'] = this.name;
    data['description'] = this.description;
    data['sellingPrice'] = this.sellingPrice;
    data['mrp'] = this.mrp;
    data['quantity'] = this.quantity;
    data['category'] = this.category;

    return data;
  }
}
