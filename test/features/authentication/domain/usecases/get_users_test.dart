import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/entities/user.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  const response = [User.empty()];

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = GetUsers(repository);
  });

  test('should call (AuthenticationRepository.getUsers) and return List<User>',
      () async {
    //Arrange

    when(() {
      return repository.getUsers();
    }).thenAnswer((_) async {
      return const Right(response);
    });

    //Act

    final result = await usecase();

    expect(result, equals(const Right<dynamic, List<User>>(response)));

    verify(() {
      return repository.getUsers();
    }).called(1);

    verifyNoMoreInteractions(repository);

    //Assert
  });
}
