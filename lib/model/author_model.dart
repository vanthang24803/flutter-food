class Author {
  final String id;
  final String username;

  Author({
    required this.id,
    required this.username,
  });

  // Factory constructor để tạo đối tượng Author từ Map
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      username: json['username'],
    );
  }
}