
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'auth_provider_test.mocks.dart';

@GenerateMocks([FirebaseAuth, User])
void main() {
  group('AuthProvider', () {
    MockFirebaseAuth mockFirebaseAuth;
    AuthProvider authProvider;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authProvider = AuthProvider(firebaseAuth: mockFirebaseAuth);
    });

    test('signInWithEmail returns User on successful sign in', () async {
      final mockUser = MockUser();
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: 'test@test.com', password: 'password'))
          .thenAnswer((_) async => UserCredential(user: mockUser));

      final user = await authProvider.signInWithEmail('test@test.com', 'password');
      expect(user, isInstanceOf<User>());
    });

    test('signUpWithEmail returns User on successful sign up', () async {
      final mockUser = MockUser();
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: 'test@test.com', password: 'password'))
          .thenAnswer((_) async => UserCredential(user: mockUser));

      final user = await authProvider.signUpWithEmail('test@test.com', 'password');
      expect(user, isInstanceOf<User>());
    });

    test('signOut calls signOut on FirebaseAuth', () async {
      await authProvider.signOut();
      verify(mockFirebaseAuth.signOut()).called(1);
    });
  });
}
