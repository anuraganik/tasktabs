
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/screens/user/user_dashboard_screen.dart';
import 'package:tasktabs/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/models/user.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'user_dashboard_test.mocks.dart';

@GenerateMocks([UserProvider])
void main() {
  group('UserDashboardScreen Widget Tests', () {
    testWidgets('UserDashboardScreen displays user info', (WidgetTester tester) async {
      final mockUserProvider = MockUserProvider();
      final user = User(id: '1', name: 'Test User', email: 'test@test.com', phoneNumber: '1234567890');
      when(mockUserProvider.user).thenReturn(user);

      await tester.pumpWidget(
        ChangeNotifierProvider<UserProvider>.value(
          value: mockUserProvider,
          child: MaterialApp(
            home: UserDashboardScreen(),
          ),
        ),
      );

      expect(find.text('Test User'), findsOneWidget);
      expect(find.text('test@test.com'), findsOneWidget);
    });
  });
}
