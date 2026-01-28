import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: context.font13TextHintRegular),
        8.verticalSpace,
        AppTextFormField(
          hintText: 'example@gmail.com',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          validator: (value) {},
        ),
      ],
    );
  }
}
