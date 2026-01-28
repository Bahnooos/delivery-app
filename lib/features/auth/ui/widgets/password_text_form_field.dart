import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password', style: context.font13TextHintRegular),
        8.verticalSpace,
        AppTextFormField(
          hintText: 'Enter Your Password',
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
