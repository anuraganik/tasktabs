class Job {
  final String id;
  final String title;
  final String description;
  final String employerId;
  final DateTime date;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.employerId,
    required this.date,
  });

  factory Job.fromMap(Map<String, dynamic> data) {
    return Job(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      employerId: data['employerId'],
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'employerId': employerId,
      'date': date.toIso8601String(),
    };
  }
}

