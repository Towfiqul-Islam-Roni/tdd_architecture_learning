import 'package:tdd_architecture_learning/features/authentication/data/models/user_model.dart';

abstract class AuthenticationDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}
