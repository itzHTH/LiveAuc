import 'package:flutter/material.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

/// Shows a styled loading dialog.
/// Call [AppLoadingDialog.show] to display and [AppLoadingDialog.hide] to dismiss.
class AppLoadingDialog {
  AppLoadingDialog._();

  static bool _isShowing = false;

  static void show(BuildContext context, {String message = 'Please wait...'}) {
    if (_isShowing) return;
    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (_) => _LoadingDialogContent(message: message),
    );
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;
    _isShowing = false;
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _LoadingDialogContent extends StatelessWidget {
  const _LoadingDialogContent({required this.message});

  final String message;

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
          ],
        ),
      ),
    );
  }
}
