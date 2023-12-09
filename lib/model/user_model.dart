class User {
  final String id;
  final String username;
  final String name;
  final int age;
  final String address;
  final String phone;
  final int role;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.age,
    required this.address,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      name: json['name'],
      age: json['age'],
      address: json['address'],
      phone: json['phone'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
