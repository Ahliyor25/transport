import 'package:flutter/material.dart';
import 'package:transport/ui/theme/app_colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ElevatedButton.styleFrom(
    primary: AppColors.pale,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
