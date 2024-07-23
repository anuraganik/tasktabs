class Employer {
  final String id;
  final String name;
  final String company;
  final String email;
  final String phoneNumber;
  final DateTime registrationDate;

  Employer({
    required this.id,
    required this.name,
    required this.company,
    required this.email,
    required this.phoneNumber,
    required this.registrationDate,
  });

  factory Employer.fromMap(Map<String, dynamic> data) {
    return Employer(
      id: data['id'],
      name: data['name'],
      company: data['company'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      registrationDate: DateTime.parse(data['registrationDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'email': email,
      'phoneNumber': phoneNumber,
      'registrationDate': registrationDate.toIso8601String(),
    };
  }
}

