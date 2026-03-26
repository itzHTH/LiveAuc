sealed class AppCheckResult {
  const AppCheckResult();
}

class MaintenanceMode extends AppCheckResult {
  final String message;
  const MaintenanceMode(this.message);
}

class ForceUpdate extends AppCheckResult {
  final String message;
  final String storeUrl;
  const ForceUpdate({required this.message, required this.storeUrl});
}

class OptionalUpdate extends AppCheckResult {
  final String message;
  final String storeUrl;
  const OptionalUpdate({required this.message, required this.storeUrl});
}

class AppOk extends AppCheckResult {
  const AppOk();
}
