class LoginResponse {
  int statusCode;
  String message;
  AfterExecution afterExecution;

  LoginResponse(
      {required this.statusCode,
      required this.message,
      required this.afterExecution});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['status_code'],
      message: json['message'],
      afterExecution: AfterExecution.fromJson(json['after execution']),
    );
  }
}

class AfterExecution {
  String accessToken;
  String refreshToken;

  AfterExecution({required this.accessToken, required this.refreshToken});

  factory AfterExecution.fromJson(Map<String, dynamic> json) {
    return AfterExecution(
      accessToken: json['accesstoken'],
      refreshToken: json['refreshtoken'],
    );
  }
}

class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
