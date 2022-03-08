class AddOnCatgory {
  final int productId;
  final String name;
  final String description;
  final double price;
  bool isAdded;
  int quantity;

  AddOnCatgory(
      {required this.productId,
      required this.name,
      required this.description,
      required this.price,
      required this.isAdded,
      required this.quantity});
}
