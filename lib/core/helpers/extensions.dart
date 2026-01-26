import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle? get font28TextPrimaryBold => textTheme.displayLarge;
  TextStyle? get font22TextPrimarySemiBold => textTheme.displayMedium;
  TextStyle? get font18TextMediumSemiBold => textTheme.displaySmall;
  TextStyle? get font16TextDarkRegular => textTheme.bodyLarge;
  TextStyle? get font14TextSecondaryRegular => textTheme.bodyMedium;
  TextStyle? get font12TextHintRegular => textTheme.bodySmall;
  TextStyle? get font16WhiteSemiBold => textTheme.labelLarge;
  TextStyle? get font11TextHintMedium => textTheme.labelSmall;
}
