class ProductModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final bool isFavourite;
  final bool isPopular;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.isFavourite = false,
    this.isPopular = false,
  });
}
