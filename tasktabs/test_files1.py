import os

# Define the directory structure
directory_structure = {
    'lib/test/unit': {
        'auth_provider_test.dart': """
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
""",
        'job_provider_test.dart': """
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/models/job.dart';
import 'package:tasktabs/services/job_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'job_provider_test.mocks.dart';

@GenerateMocks([JobService])
void main() {
  group('JobProvider', () {
    MockJobService mockJobService;
    JobProvider jobProvider;

    setUp(() {
      mockJobService = MockJobService();
      jobProvider = JobProvider(jobService: mockJobService);
    });

    test('fetchJobs updates job list', () async {
      final job = Job(id: '1', title: 'Test Job', description: 'Job Description', employerId: '1');
      when(mockJobService.fetchJobs()).thenAnswer((_) async => [job]);

      await jobProvider.fetchJobs();

      expect(jobProvider.jobs, contains(job));
    });

    test('addJob adds a job to the list', () async {
      final job = Job(id: '1', title: 'Test Job', description: 'Job Description', employerId: '1');

      await jobProvider.addJob(job);

      verify(mockJobService.addJob(job)).called(1);
      expect(jobProvider.jobs, contains(job));
    });
  });
}
""",
        'user_provider_test.dart': """
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
""",
        'employer_provider_test.dart': """
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
"""
    },
    'lib/test/integration': {
        'auth_integration_test.dart': """
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
""",
        'job_integration_test.dart': """
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/models/job.dart';

void main() {
  group('Job Integration Tests', () {
    test('fetchJobs retrieves job list', () async {
      final jobProvider = JobProvider();

      await jobProvider.fetchJobs();

      expect(jobProvider.jobs, isNotEmpty);
    });

    test('addJob adds a job', () async {
      final jobProvider = JobProvider();
      final job = Job(id: '1', title: 'Integration Test Job', description: 'Job Description', employerId: '1');

      await jobProvider.addJob(job);

      expect(jobProvider.jobs, contains(job));
    });
  });
}
""",
        'payment_integration_test.dart': """
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
"""
    }
}

# Create directories and files
for dir_path, files in directory_structure.items():
    os.makedirs(dir_path, exist_ok=True)
    for file_name, content in files.items():
        with open(os.path.join(dir_path, file_name), 'w') as f:
            f.write(content)

print("Test files created successfully.")

