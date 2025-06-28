class ItemModel {
  final int id;
  final String type;
  final String name;
  final double price;
  final double rating;
  final String description;
  final String restaurant;
  final String imageUrl;
  final int reviewCounter;
  final String deliveryTime;

  ItemModel({
    required this.id,
    required this.type,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.restaurant,
    required this.imageUrl,
    required this.reviewCounter,
    required this.deliveryTime,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      description: json['description'],
      restaurant: json['restaurant'],
      imageUrl: json['imageUrl'],
      reviewCounter: json['review_counter'],
      deliveryTime: json['delivery_time'],
    );
  }
}
