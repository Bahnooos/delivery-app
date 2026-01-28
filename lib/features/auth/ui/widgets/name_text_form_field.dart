import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class NameTextFormField extends StatefulWidget {
  const NameTextFormField({super.key});

  @override
  State<NameTextFormField> createState() => _NameTextFormFieldState();
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: context.font13TextHintRegular),
        8.verticalSpace,
        AppTextFormField(
          hintText: 'Enter Your Name',
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