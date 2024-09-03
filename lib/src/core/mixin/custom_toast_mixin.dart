import 'package:get/get.dart';
import 'package:mpia/src/core/utils/ui_constants/app_colors.dart';

mixin CustomToastMixin {
  void toastError({
    required String title,
    required String message,
    Duration? duration,
    double? pading,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppTheme.errorColor,
      colorText: AppTheme.white,
    );
  }

  void toastSuccess({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppTheme.successColor,
      colorText: AppTheme.white,
    );
  }
}
