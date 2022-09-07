import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/account_type.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? id,
    required String name,
    String? profileImage,
    required AccountType accountType,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
