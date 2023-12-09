
import 'package:food/model/review_model.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String image;
  final int star;
  final String author;
  final List<Review> reviews;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.star,
    required this.author,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor để tạo đối tượng Product từ Map
  factory Product.fromJson(Map<String, dynamic> json) {
    // Chuyển đổi danh sách đánh giá từ Map sang List<Review>
    final List<dynamic> reviewsData = json['reviews'];
    final List<Review> reviews =
        reviewsData.map((reviewData) => Review.fromJson(reviewData)).toList();

    return Product(
      id: json['_id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      star: json['star'],
      author: json['author'],
      reviews: reviews,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
