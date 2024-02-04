import 'package:tdd_architecture_learning/core/usecase/usecase.dart';
import 'package:tdd_architecture_learning/core/utils/typedef.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/entities/user.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  final AuthenticationRepository _repository;

  const GetUsers(this._repository);

  @override
  ResultFuture<List<User>> call() async {
    return _repository.getUsers();
  }
}
