class RegisterModel {
  final int? id;
  final String userName;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterModel({
    this.id,
    required this.userName,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'],
      userName: json['userName'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
