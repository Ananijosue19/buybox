import 'dart:ui';

class AppColors {
  static const Color primary = Color(0xFF00796B);
  static const Color primaryContainer = Color(0xFFB2DFDB);
  static const Color secondary = Color(0xFFFF7043);
  static const Color accent = Color(0xFFFFC107);
  
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  
  static const Color textPrimary = Color(0xFF263238);
  static const Color textSecondary = Color(0xFF546E7A);
  static const Color textHint = Color(0xFF90A4AE);
  
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFD32F2F);
  
  static const Color cardShadow = Color(0x0A000000);
}

// Keeping these for backward compatibility during refactoring if needed, but will phase out
const blueColor = AppColors.primary;
const greenColor = AppColors.success;
const yellowColor = AppColors.accent;
