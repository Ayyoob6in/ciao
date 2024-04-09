class ResetPasswordResponse {
  int? statusCode;
  String? message;

  ResetPasswordResponse({this.statusCode, this.message});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}
