import 'package:flutter/material.dart';

/// Controller that allows [AuthPageLayout] to expose navigation methods
/// to its page children.
///
/// Screens should create and hold an instance of this controller,
/// then pass it to both [AuthPageLayout] and their page widgets.
class AuthPageController {
  VoidCallback? _nextPage;
  VoidCallback? _previousPage;

  /// Called internally by [AuthPageLayout] on [initState].
  // ignore: use_setters_to_change_properties
  void attach({
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    _nextPage = nextPage;
    _previousPage = previousPage;
  }

  /// Called internally by [AuthPageLayout] on [dispose].
  void detach() {
    _nextPage = null;
    _previousPage = null;
  }

  void nextPage() => _nextPage?.call();
  void previousPage() => _previousPage?.call();
}
