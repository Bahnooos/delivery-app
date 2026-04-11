class MealEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double? rating;
  final String? category;
  final bool? isAvailable;

  const MealEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating,
    this.category,
    this.isAvailable,
  });
}
