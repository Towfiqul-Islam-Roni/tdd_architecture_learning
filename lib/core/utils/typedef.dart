import 'package:dartz/dartz.dart';
import 'package:tdd_architecture_learning/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = Future<Either<Failure, void>>;

typedef DataMap = Map<String, dynamic>;
