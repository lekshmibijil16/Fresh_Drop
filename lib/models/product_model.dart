class Product {
  final String id;
  final String name;
  final String category;
  final String image;
  final double price;
  final double oldPrice;
  final String unit;
  final String description;
  final double rating;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.unit,
    required this.description,
    required this.rating,
  });

  int get discountPercent {
    if (oldPrice <= price) return 0;

    return (((oldPrice - price) / oldPrice) * 100).round();
  }
}