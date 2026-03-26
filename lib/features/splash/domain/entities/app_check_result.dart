sealed class AppCheckResult {
  const AppCheckResult();
}

class MaintenanceMode extends AppCheckResult {
  final String message;
  const MaintenanceMode(this.message);
}

class ForceUpdate extends AppCheckResult {
  final String storeUrl;
  final String currentVersion;
  const ForceUpdate({required this.storeUrl, required this.currentVersion});
}

class OptionalUpdate extends AppCheckResult {
  final String storeUrl;
  const OptionalUpdate({required this.storeUrl});
}

class AppOk extends AppCheckResult {
  const AppOk();
}
