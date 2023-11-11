import 'package:food/model/author_model.dart';

class Review {
  final String id;
  final String title;
  final double star;
  final String createdAt;
  final String updatedAt;
  final Author author;

  Review({
    required this.id,
    required this.title,
    required this.star,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  // Factory constructor để tạo đối tượng Review từ Map
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'],
      title: json['title'],
      star: json['star'].toDouble(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      author: Author.fromJson(json['author']),
    );
  }
}
