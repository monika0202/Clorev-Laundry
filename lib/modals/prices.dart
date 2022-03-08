class Prices {
  String cartValue;
  String basePrice;
  String starPrice;
  String gst;
  String igst;
  String cgst;
  String sgst;
  String deliveryPrice;
  String payableAmount;
  String halfPayableAmount;

  Prices(
      {required this.cartValue,
      required this.basePrice,
      required this.starPrice,
      required this.gst,
      required this.igst,
      required this.cgst,
      required this.sgst,
      required this.deliveryPrice,
      required this.halfPayableAmount,
      required this.payableAmount});
}
