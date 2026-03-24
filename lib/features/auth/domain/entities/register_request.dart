class RegisterRequest {
  final String firstName;
  final String lastName;
  final String password;
  final String registerToken;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.registerToken,
  });
}
