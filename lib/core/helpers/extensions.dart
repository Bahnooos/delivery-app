import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeNamed,
    RoutePredicate predicate, {
    Object? argument,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeNamed, predicate, arguments: argument);
  }

  void pop() => Navigator.pop(this);
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle? get font28TextPrimaryBold => textTheme.displayLarge;
  TextStyle? get font22TextPrimarySemiBold => textTheme.displayMedium;
  TextStyle? get font18TextMediumSemiBold => textTheme.displaySmall;
  TextStyle? get font16TextDarkRegular => textTheme.bodyLarge;
  TextStyle? get font14TextSecondaryRegular => textTheme.bodyMedium;
  TextStyle? get font13TextHintRegular => textTheme.bodySmall;
  TextStyle? get font16WhiteSemiBold => textTheme.labelLarge;
  TextStyle? get font11TextHintMedium => textTheme.labelSmall;
}
