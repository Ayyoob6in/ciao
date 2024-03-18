class OtpVerificationResponse {
  final int statusCode;
  final String message;
  final Map<String, dynamic> afterExecution;

  OtpVerificationResponse({
    required this.statusCode,
    required this.message,
    required this.afterExecution,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerificationResponse(
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      afterExecution: json['after execution'] ?? {},
    );
  }
}
