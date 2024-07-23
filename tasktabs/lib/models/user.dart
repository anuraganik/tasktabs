class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final DateTime registrationDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.registrationDate,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      registrationDate: DateTime.parse(data['registrationDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'registrationDate': registrationDate.toIso8601String(),
    };
  }
}

