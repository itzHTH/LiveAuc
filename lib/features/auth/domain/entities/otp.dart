class Otp {
  final dynamic registerToken;
  final bool succeeded;
  final String message;

  Otp({
    required this.registerToken,
    required this.succeeded,
    required this.message,
  });
}
