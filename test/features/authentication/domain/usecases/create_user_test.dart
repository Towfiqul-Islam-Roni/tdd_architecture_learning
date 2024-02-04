import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;
  const params = CreateUserParams.empty();

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = CreateUser(repository);
  });

  test(
    "should create user by calling (AuthenticationRepository.createUser)",
    () async {
      //Arrange

      when(() {
        return repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        );
      }).thenAnswer((_) async {
        return const Right(null);
      });

      //Act

      final result = await usecase(params);

      //Assert

      expect(result, equals(const Right<dynamic, void>(null)));

      verify(() {
        return repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        );
      }).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
