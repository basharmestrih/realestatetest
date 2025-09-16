class UserModel {
  final int id;
  final String username;
  final String email;
  final String role;
  final String token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['name'],
      email: json['email'],
      role: json['role'] ?? 'user',
      token: json['token'], // we'll inject this manually from access_token
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': username,
      'email': email,
      'role': role,
      'token': token,
    };
  }
}
