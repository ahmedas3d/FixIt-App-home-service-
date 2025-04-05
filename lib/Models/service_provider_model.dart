class ServiceProvider {
  final String id;
  final String name;
  final int phoneNumber;
  final int experience;
  final String serviceArea;
  final String servicesLicense;
  final String certification;
  final String? image;
  final String specialty;
  final String bio;
  final double rating;
  final List<String> skills;
  final int orders;
  final WorkHour workHour;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.experience,
    required this.serviceArea,
    required this.servicesLicense,
    required this.certification,
    this.image,
    required this.specialty,
    required this.bio,
    required this.rating,
    required this.skills,
    required this.orders,
    required this.workHour,
  });
  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['_id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as int,
      experience: json['experience'] as int,
      serviceArea: json['serviceArea'] as String,
      servicesLicense: json['servicesLicense'] as String,
      certification: json['certification'] as String,
      image: json['image'] as String,
      specialty: json['specialty'] as String,
      bio: json['bio'] as String,
      rating: (json['rating'] as num).toDouble(),
      skills: List<String>.from(json['skills'] as List),
      orders: json['orders'] as int,
      workHour: WorkHour.fromJson(json['workHour'] as Map<String, dynamic>),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'experience': experience,
      'serviceArea': serviceArea,
      'servicesLicense': servicesLicense,
      'certification': certification,
      'image': image,
      'specialty': specialty,
      'bio': bio,
      'rating': rating,
      'skills': skills,
      'orders': orders,
      'workHour': workHour.toJson(),
    };
  }
}

class WorkHour {
  final int from;
  final int to;

  WorkHour({required this.from, required this.to});

  factory WorkHour.fromJson(Map<String, dynamic> json) {
    return WorkHour(from: json['from'] as int, to: json['to'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'from': from, 'to': to};
  }
}
