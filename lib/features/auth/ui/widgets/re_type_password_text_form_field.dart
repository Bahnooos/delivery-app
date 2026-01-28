import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class ReTypePasswordTextFormField extends StatefulWidget {
  const ReTypePasswordTextFormField({super.key});

  @override
  State<ReTypePasswordTextFormField> createState() => _ReTypePasswordTextFormFieldState();
}

class _ReTypePasswordTextFormFieldState extends State<ReTypePasswordTextFormField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Re-type Password', style: context.font13TextHintRegular),
        8.verticalSpace,
        AppTextFormField(
          hintText: 'Re-type Your Password',
          isObscureText: !isVisible,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          validator: (value) {},
          suffixIcon: InkWell(
            onTap: () => setState(() => isVisible = !isVisible),
            child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ],
    );
  }
}