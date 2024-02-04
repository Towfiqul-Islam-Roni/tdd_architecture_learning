import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const User.empty()
      : this(
          id: 1,
          createdAt: 'empty_createdAt',
          name: 'empty_name',
          avatar: 'empty_avatar',
        );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        name,
        avatar,
      ];
}
