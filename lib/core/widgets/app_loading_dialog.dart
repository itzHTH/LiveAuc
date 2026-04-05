import 'package:flutter/material.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

/// Shows a styled loading dialog.
/// Call [AppLoadingDialog.show] to display and [AppLoadingDialog.hide] to dismiss.
///
/// When [onCancel] is provided, the dialog becomes cancellable:
/// - A cancel button appears below the spinner
/// - The back button dismisses the dialog and triggers cancellation
class AppLoadingDialog {
  AppLoadingDialog._();

  static bool _isShowing = false;

  static void show(
    BuildContext context, {
    String message = 'Please wait...',
    VoidCallback? onCancel,
  }) {
    if (_isShowing) return;
    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (_) => PopScope(
        canPop: onCancel != null,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop && onCancel != null) {
            _isShowing = false;
            onCancel();
          }
        },
        child: _LoadingDialogContent(
          message: message,
          onCancel: onCancel != null
              ? () {
                  hide(context);
                  onCancel();
                }
              : null,
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;
    _isShowing = false;
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _LoadingDialogContent extends StatelessWidget {
  const _LoadingDialogContent({
    required this.message,
    this.onCancel,
  });

  final String message;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
        decoration: BoxDecoration(
          color: AppColor.elementBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Spinner
            const SizedBox(
              width: 52,
              height: 52,
              child: CircularProgressIndicator(
                strokeWidth: 3.5,
                backgroundColor: AppColor.primary50,
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary700),
              ),
            ),
            const SizedBox(height: 24),
            // Message
            Text(
              message,
              style: AppTextStyles.font16GrayRegular,
              textAlign: TextAlign.center,
            ),
            // Cancel button (only when cancellable)
            if (onCancel != null) ...[
              const SizedBox(height: 20),
              TextButton(
                onPressed: onCancel,
                child: Text(
                  'Cancel',
                  style: AppTextStyles.font16GrayRegular?.copyWith(
                    color: AppColor.primary700,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

