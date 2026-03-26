class AppStatus {
  final bool isMaintenance;
  final bool updateRequired;
  final bool isBanned;
  final String message;
  final String? storeUrl;
  final String minimumVersion;
  final String currentVersion;

  AppStatus({
    required this.isMaintenance,
    required this.updateRequired,
    required this.isBanned,
    required this.message,
    required this.storeUrl,
    required this.minimumVersion,
    required this.currentVersion,
  });
}
