import 'dart:async';

import 'package:delivery_app/core/helpers/app_regex.dart';
import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/core/widgets/app_text_form_field.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_cubit.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_cubit.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/forget_password_bloc_listener.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OTPVerifyResetPassword extends StatefulWidget {
  const OTPVerifyResetPassword({super.key, required this.email});
  final String? email;

  @override
  State<OTPVerifyResetPassword> createState() => _OTPVerifyResetPasswordState();
}

class _OTPVerifyResetPasswordState extends State<OTPVerifyResetPassword> {
  late final TextEditingController pinController;
  bool isVisible = false;
  late final TextEditingController passwordController;
  Timer? timer;
  int seconds = 60;
  bool isTappedResend = false;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    passwordController=TextEditingController();
    focusNode = FocusNode();
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();
    timer?.cancel();
    super.dispose();
  }

  void _resendCode() {
    context.read<VerificationCubit>().resendVerificationCode(
      email: widget.email!,
    );
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 62.w,
      height: 62.h,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Form(
      key: formKey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('code', style: AppTextStyles.font16TextDarkRegular),
                  InkWell(
                    onTap:  seconds == 0
                        ? () {
                            _resendCode();
                            _startTimer();
                          }
                        : null,
                    child: Text(
                      seconds == 0 ? 'Resend Code' : 'Resend in $seconds s',
                      style: AppTextStyles.font16TextDarkRegular,
                    ),
                  ),
                ],
              ),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  // You can pass your own SmsRetriever implementation based on any package
                  // in this example we are using the SmartAuth
                  controller: pinController,
                  focusNode: focusNode,
                  length: 6,
                  separatorBuilder: (index) => 16.horizontalSpace,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pin is required';
                    }
                    if (value.length < 6) {
                      return 'Pin must be 6 digits';
                    }
                    return null;
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    context.read<VerificationCubit>().emitVerificationStates(
                      email: widget.email,
                      otp: pin,
                    );
                  },
                  onChanged: (value) {},
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
                16.verticalSpace,
              Text('Password', style: context.font13TextHintRegular),
              8.verticalSpace,
              AppTextFormField(
                controller:passwordController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (!AppRegex.isPasswordValid(value)) {
                    return 'Please enter a valid password';
                  }
                },
                suffixIcon: InkWell(
                  onTap: () => setState(() => isVisible = !isVisible),
                  child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              32.verticalSpace,
              CustomElevatedButton(
                onPressed: () {
                  focusNode.unfocus();
                  formKey.currentState!.validate();
                  context.read<ForgetAndResetPasswordCubit>().emitResetPasswordState(
                    email: widget.email!,
                    newPassword: passwordController.text,
                    otp: pinController.text,
                  );
                },
                text: 'Validate',
              ),
              ForgetPasswordBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
