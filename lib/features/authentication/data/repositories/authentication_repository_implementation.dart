import 'package:dartz/dartz.dart';
import 'package:tdd_architecture_learning/core/errors/api_failure.dart';
import 'package:tdd_architecture_learning/core/errors/exceptions.dart';
import 'package:tdd_architecture_learning/core/utils/typedef.dart';
import 'package:tdd_architecture_learning/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/entities/user.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationDataSource _dataSource;

  const AuthenticationRepositoryImplementation(this._dataSource);

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    try {
      final result = await _dataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _dataSource.getUsers();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
