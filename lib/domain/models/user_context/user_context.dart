import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/account_type.dart';

part 'user_context.freezed.dart';
part 'user_context.g.dart';

@freezed
class UserContext with _$UserContext {
  const factory UserContext({
    String? id,
    String? displayName,
    String? profileImage,
    AccountType? accountType,
  }) = _UserContext;

  factory UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(json);
}
