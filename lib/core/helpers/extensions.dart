import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpaceExtensions on num {
  SizedBox get verticalSpace => SizedBox(height: h);
  SizedBox get horizontalSpace => SizedBox(width: w);
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle? get displayLarge_28 => textTheme.displayLarge;
  TextStyle? get displayMedium_22 => textTheme.displayMedium;
  TextStyle? get displaySmall_18 => textTheme.displaySmall;
  TextStyle? get bodyLarge_16 => textTheme.bodyLarge;
  TextStyle? get bodyMedium_14 => textTheme.bodyMedium;
  TextStyle? get bodySmall_12 => textTheme.bodySmall;
  TextStyle? get labelLarge_16 => textTheme.labelLarge;
  TextStyle? get labelSmall_11 => textTheme.labelSmall;
}
