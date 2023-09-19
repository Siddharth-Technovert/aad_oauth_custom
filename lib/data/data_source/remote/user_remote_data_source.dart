import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../../domain/enums/account_type.dart';
import '../../models/api/user/user_api_dto.dart';

class UserRemoteDataSource {
  // ignore: unused_field
  final ApiManager _apiManager;

  UserRemoteDataSource(this._apiManager);

  Future<ApiResponse<UserApiDto>> createUser(AccountType accountType) async {
    return ApiResponseSuccess(
      UserApiDto(
        id: "0",
        name: "Jon Snow",
        accountType: accountType,
      ),
    );
  }
}
