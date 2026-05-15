import 'package:flutter/material.dart';

/// Abstract analytics service that defines the contract for all analytics operations.
/// Any analytics provider (Firebase, Mixpanel, etc.) must implement this interface.
abstract class AnalyticsService {
  /// Returns a [NavigatorObserver] for automatic screen tracking.
  NavigatorObserver getNavigatorObserver();

  /// Logs a custom event with optional parameters.
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  });

  /// Logs a screen view event.
  Future<void> logScreenView({required String screenName});

  /// Logs a login event.
  Future<void> logLogin({required String method});

  /// Logs a sign-up event.
  Future<void> logSignUp({required String method});

  /// Sets the current user ID for analytics tracking.
  Future<void> setUserId(String? userId);

  /// Sets a user property for segmentation.
  Future<void> setUserProperty({
    required String name,
    required String? value,
  });
}
