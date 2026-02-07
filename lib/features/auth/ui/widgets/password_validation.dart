import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  final bool hasMatched;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
    required this.hasMatched,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.h,
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),     
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        buildValidationRow('At least 1 special character', hasSpecialCharacters),
        buildValidationRow('At least 1 number', hasNumber),
        buildValidationRow('At least 8 characters long', hasMinLength),
        buildValidationRow('password and confirm password must be same', hasMatched),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.gray,
        ),
        6.horizontalSpace,
        Text(
          text,
          style: AppTextStyles.font13TextHintRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.gray : AppColors.textDark,
          ),
        )
      ],
    );
  }
}