
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/services/payment_service.dart';
import 'package:tasktabs/models/transaction.dart';

void main() {
  group('Payment Integration Tests', () {
    test('processPayment and fetchTransactions flow', () async {
      final paymentService = PaymentService();
      final transaction = Transaction(id: '1', userId: '1', amount: 100.0, date: DateTime.now());

      await paymentService.processPayment(transaction);

      final transactions = await paymentService.fetchTransactions('1');
      expect(transactions, contains(transaction));
    });
  });
}
