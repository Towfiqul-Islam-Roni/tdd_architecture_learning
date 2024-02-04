import 'package:equatable/equatable.dart';
import 'package:tdd_architecture_learning/core/usecase/usecase.dart';
import 'package:tdd_architecture_learning/core/utils/typedef.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository _repository;

  const CreateUser(this._repository);

  @override
  ResultVoid call(CreateUserParams params) async {
    return _repository.createUser(
      createdAt: params.createdAt,
      name: params.name,
      avatar: params.avatar,
    );
  }
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
          createdAt: 'empty_createdAt',
          name: 'empty_name',
          avatar: 'empty_avatar',
        );

  @override
  List<Object?> get props => [
        createdAt,
        name,
        avatar,
      ];
}
