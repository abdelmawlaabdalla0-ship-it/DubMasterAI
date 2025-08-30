class UserModel {
  final String username;
  final String email;
  final bool confirmEmail;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.username,
    required this.email,
    required this.confirmEmail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      confirmEmail: json['confirmEmail'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'confirmEmail': confirmEmail,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
