class Product {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String category;
  final String brand;
  final double price;
  final double discountPercentage;
  final double rating;
  final List imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.brand,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No description',
      thumbnail: json['thumbnail'] ?? 'No thumbnail',
      category: json['category'] ?? 'No thumbnail',
      brand: json['brand'] ?? 'No Brand',
      price: json['price']?.toDouble() ?? 0.0,
      discountPercentage: json['discountPercentage']?.toDouble() ?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0,
      imageUrl: (json['images'] as List) ?? [''],
    );
  }
}
