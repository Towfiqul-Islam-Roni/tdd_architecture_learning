import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_architecture_learning/core/errors/api_failure.dart';
import 'package:tdd_architecture_learning/core/errors/exceptions.dart';
import 'package:tdd_architecture_learning/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:tdd_architecture_learning/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/entities/user.dart';

void main() {
  late AuthenticationDataSource dataSource;
  late AuthenticationRepositoryImplementation repositoryImplementation;
  setUp(() {
    dataSource = MockAuthenticationDataSource();
    repositoryImplementation =
        AuthenticationRepositoryImplementation(dataSource);
  });

  const exception = ServerException(
    message: 'Unknown error occurred',
    statusCode: 500,
  );

  group('createUser', () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';

    test(
        'should call the (RemoteDatasource.createUser) and complete '
        'successfully when the remote source call is successful', () async {
      //Arrange

      when(
        () => dataSource.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async {
        return Future.value();
      });

      //Act
      final result = await repositoryImplementation.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );

      //Assert

      expect(result, equals(const Right(null)));

      verify(
        () => dataSource.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should return a [ServerFailure] when the call to the remote '
        'source is unsuccessful', () async {
      //Arrange
      when(() {
        return dataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'));
      }).thenThrow(exception);
      final result = await repositoryImplementation.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );

      expect(
        result,
        equals(
          Left(
            ApiFailure(
              message: exception.message,
              statusCode: exception.statusCode,
            ),
          ),
        ),
      );

      verify(() => dataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          )).called(1);

      verifyNoMoreInteractions(dataSource);
    });
  });

  group('getUser', () {
    test(
        'should call the (RemoteDatasource.getUser) and return '
        '(List<User>) successfully when the remote source call is successful',
        () async {
      //Arrange

      when(
        () => dataSource.getUsers(),
      ).thenAnswer((_) async {
        return [];
      });

      //Act
      final result = await repositoryImplementation.getUsers();

      //Assert

      expect(result, equals(isA<Right<dynamic, List<User>>>));

      verify(
        () => dataSource.getUsers(),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should return a [ServerFailure] when the call to the remote '
        'source is unsuccessful', () async {
      //Arrange
      when(() {
        return dataSource.getUsers();
      }).thenThrow(exception);
      final result = await repositoryImplementation.getUsers();

      expect(
        result,
        equals(
          Left(
            ApiFailure(
              message: exception.message,
              statusCode: exception.statusCode,
            ),
          ),
        ),
      );

      verify(() => dataSource.getUsers()).called(1);

      verifyNoMoreInteractions(dataSource);
    });
    test('', () async {});
  });
}

class MockAuthenticationDataSource extends Mock
    implements AuthenticationDataSource {}
