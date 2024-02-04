import 'dart:convert';

import 'package:tdd_architecture_learning/core/utils/typedef.dart';
import 'package:tdd_architecture_learning/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.avatar,
  });

  factory UserModel.fromJson(String source) {
    return UserModel.fromMap(jsonDecode(source) as DataMap);
  }

  const UserModel.empty()
      : this(
          id: 1,
          createdAt: 'empty_createdAt',
          name: 'empty_name',
          avatar: 'empty_avatar',
        );

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
          avatar: map['avatar'] as String,
        );

  UserModel copyWith({
    int? id,
    String? avatar,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  DataMap toMap() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'avatar': avatar,
      };

  String toJson() => jsonEncode(toMap());
}
