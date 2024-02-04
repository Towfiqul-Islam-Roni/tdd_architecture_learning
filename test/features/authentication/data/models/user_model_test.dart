import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_architecture_learning/core/utils/typedef.dart';
import 'package:tdd_architecture_learning/features/authentication/data/models/user_model.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final json = fixture("user.json");
  final map = jsonDecode(json) as DataMap;

  const model = UserModel.empty();

  test('should be a subclass of (User) entity', () {
    //Arrange
    //Act

    //Assert
    expect(model, isA<User>());
  });

  group('fromMap', () {
    test('should return a (UserModel) with the right data', () {
      //Arrange
      //Act
      final result = UserModel.fromMap(map);
      expect(result, equals(model));
      //Assert
    });
  });

  group('fromJson', () {
    test('should return a (UserModel) with the right data', () {
      //Arrange
      //Act
      final result = UserModel.fromJson(json);
      expect(result, equals(model));
      //Assert
    });
  });

  group('toMap', () {
    test('should return a (Map) with the right data', () {
      //Arrange
      //Act
      final result = model.toMap();
      expect(result, equals(map));
      //Assert
    });
  });

  group('toJson', () {
    test('should return a (Json) with the right data', () {
      //Arrange
      //Act
      final result = model.toJson();
      expect(result, equals(json));
      //Assert
    });
  });

  group('copyWith', () {
    test('should return a (UserModel) with the different data', () {
      //Arrange
      //Act
      final result = model.copyWith(name: "empty_name");
      expect(result.name, equals('empty_name'));
      //Assert
    });
  });
}
