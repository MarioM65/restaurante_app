class CreateUserDto {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String profile;

  CreateUserDto({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.profile,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'profile': profile,
    };
  }
}