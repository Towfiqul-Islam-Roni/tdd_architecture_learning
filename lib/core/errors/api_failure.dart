import 'package:tdd_architecture_learning/core/errors/exceptions.dart';
import 'package:tdd_architecture_learning/core/errors/failure.dart';

class ApiFailure extends Failure {
  const ApiFailure({
    required super.message,
    required super.statusCode,
  });

  ApiFailure.fromException(ServerException exception)
      : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}
