class ApiErrorResponse {
  final String? code;
  final String? message;
  final String? reason;
  final String? error;
  final ApiErrorDataStatus? data;
  ApiErrorResponse({
    required this.code,
    required this.message,
    required this.reason,
    required this.data,
    required this.error,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      code: json['code'] as String?,
      message: json['message'] as String?,
      reason: json['reason'] as String?,
      data: json['data'] == null
          ? null
          : ApiErrorDataStatus.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );
  }
}

class ApiErrorDataStatus {
  final int? status;
  ApiErrorDataStatus({
    required this.status,
  });

  factory ApiErrorDataStatus.fromJson(Map<String, dynamic> json) {
    return ApiErrorDataStatus(
      status: json['status'] as int?,
    );
  }
}
