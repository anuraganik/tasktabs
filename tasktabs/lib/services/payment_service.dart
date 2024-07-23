
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/transaction.dart';

class PaymentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> processPayment(Transaction transaction) async {
    await _db.collection('transactions').add(transaction.toMap());
  }

  Future<List<Transaction>> fetchTransactions(String userId) async {
    QuerySnapshot snapshot = await _db.collection('transactions').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => Transaction.fromFirestore(doc)).toList();
  }
}
