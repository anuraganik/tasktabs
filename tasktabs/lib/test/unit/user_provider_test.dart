
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/user_provider.dart';
import 'package:tasktabs/models/user.dart';
import 'package:tasktabs/services/user_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'user_provider_test.mocks.dart';

@GenerateMocks([UserService])
void main() {
  group('UserProvider', () {
    MockUserService mockUserService;
    UserProvider userProvider;

    setUp(() {
      mockUserService = MockUserService();
      userProvider = UserProvider(userService: mockUserService);
    });

    test('getUser updates user data', () async {
      final user = User(id: '1', name: 'Test User', email: 'test@test.com', phoneNumber: '1234567890');
      when(mockUserService.getUser('1')).thenAnswer((_) async => user);

      await userProvider.getUser('1');

      expect(userProvider.user, user);
    });

    test('updateUser updates user data', () async {
      final user = User(id: '1', name: 'Test User', email: 'test@test.com', phoneNumber: '1234567890');

      await userProvider.updateUser(user);

      verify(mockUserService.updateUser(user)).called(1);
      expect(userProvider.user, user);
    });
  });
}
