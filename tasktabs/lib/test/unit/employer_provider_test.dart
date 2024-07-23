
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/employer_provider.dart';
import 'package:tasktabs/models/employer.dart';
import 'package:tasktabs/services/employer_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'employer_provider_test.mocks.dart';

@GenerateMocks([EmployerService])
void main() {
  group('EmployerProvider', () {
    MockEmployerService mockEmployerService;
    EmployerProvider employerProvider;

    setUp(() {
      mockEmployerService = MockEmployerService();
      employerProvider = EmployerProvider(employerService: mockEmployerService);
    });

    test('getEmployer updates employer data', () async {
      final employer = Employer(id: '1', name: 'Test Employer', email: 'test@test.com');
      when(mockEmployerService.getEmployer('1')).thenAnswer((_) async => employer);

      await employerProvider.getEmployer('1');

      expect(employerProvider.employer, employer);
    });

    test('updateEmployer updates employer data', () async {
      final employer = Employer(id: '1', name: 'Test Employer', email: 'test@test.com');

      await employerProvider.updateEmployer(employer);

      verify(mockEmployerService.updateEmployer(employer)).called(1);
      expect(employerProvider.employer, employer);
    });
  });
}
