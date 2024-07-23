class Transaction {
  final String id;
  final String userId;
  final String jobId;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.userId,
    required this.jobId,
    required this.amount,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> data) {
    return Transaction(
      id: data['id'],
      userId: data['userId'],
      jobId: data['jobId'],
      amount: data['amount'],
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'jobId': jobId,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}

