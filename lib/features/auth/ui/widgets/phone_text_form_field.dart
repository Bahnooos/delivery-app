import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({super.key});

  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: AppTextStyles.font13TextHintRegular),
        SizedBox(height: 8),
        AppTextFormField(
          hintText: 'Enter Your Phone Number',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          validator: (value) {},
        ),
      ],
    );
  }
}
