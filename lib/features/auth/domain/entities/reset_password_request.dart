class ResetPasswordRequest {
  final String email;
  final String password;
  final String token;

  ResetPasswordRequest({
    required this.email,
    required this.password,
    required this.token,
  });
}
