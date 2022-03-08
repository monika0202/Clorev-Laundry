class BrandCatgory {
  final int productId;
  final String type;
  final String category;
  final String name;
  final double mrp;
  final double? sellingPrice;
  bool isAdded;
  int quantity;

  BrandCatgory(
      {required this.productId,
      required this.name,
      required this.mrp,
      required this.sellingPrice,
      required this.isAdded,
      required this.type,
      required this.category,
      required this.quantity});
}
