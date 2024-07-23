
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  group('Auth Integration Tests', () {
    test('signInWithEmail and signOut flow', () async {
      final authProvider = AuthProvider();

      final user = await authProvider.signInWithEmail('test@test.com', 'password');
      expect(user, isInstanceOf<User>());

      await authProvider.signOut();
      expect(authProvider.currentUser, null);
    });

    test('signUpWithEmail flow', () async {
      final authProvider = AuthProvider();

      final user = await authProvider.signUpWithEmail('newuser@test.com', 'password');
      expect(user, isInstanceOf<User>());
    });
  });
}
