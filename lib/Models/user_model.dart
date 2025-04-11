class UserModel {
  final String? id;
  final String name;
  final String email;
  final String? image;
  final String phoneNumber;
  final String country;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.image,
    required this.phoneNumber,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? json['id'],
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'phoneNumber': phoneNumber,
      'country': country,
    };
  }
}
