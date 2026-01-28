import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  bool isRememberMeChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: isRememberMeChecked,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                side: BorderSide(color: AppColors.checkBoxBorderColor),
                onChanged: (value) {
                  setState(() => isRememberMeChecked = value ?? false);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),

            Text(
              'Remember Me',
              style: context.font13TextHintRegular?.copyWith(
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Forget Password?',
            style: context.font13TextHintRegular?.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
