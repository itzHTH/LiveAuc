class AppVersion {
  final int major;
  final int minor;
  final int patch;

  AppVersion({required this.major, required this.minor, required this.patch});

  factory AppVersion.parse(String version) {
    final parts = version.split('.');
    if (parts.length != 3) {
      throw FormatException('Invalid version format: $version');
    }
    return AppVersion(
      major: int.parse(parts[0]),
      minor: int.parse(parts[1]),
      patch: int.parse(parts[2]),
    );
  }

  /// Returns:
  /// 0 if versions are equal
  /// -1 if this version is older than other
  /// 1 if this version is newer than other
  int compareTo(AppVersion other) {
    if (major != other.major) {
      return major.compareTo(other.major);
    }
    if (minor != other.minor) {
      return minor.compareTo(other.minor);
    }
    return patch.compareTo(other.patch);
  }
}
