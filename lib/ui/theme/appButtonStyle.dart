import 'package:flutter/material.dart';
import 'package:transport/ui/theme/app_colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ElevatedButton.styleFrom(
    primary: AppColors.blueBase,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.only(top: 23, bottom: 23),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
