import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetAndResetPasswordCubit extends Cubit<ForgetAndResetPasswordState> {
  AuthRepo authRepo;
  ForgetAndResetPasswordCubit({required this.authRepo})
    : super(ForgetAndResetPasswordInitialState());
  Future<void> emitForgetPasswordState({required String email}) async {
    emit(ForgetAndResetPasswordLoadingState());
    final result = await authRepo.forgetPassword(email: email);
    result.when(
      success: (data) {
        emit(ForgetPasswordSuccessState(data: data));
      },
      failure: (failure) {
        emit(ForgetPasswordErrorState(failure: failure));
      },
    );
  }

  Future<void> emitResetPasswordState({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    emit(ForgetAndResetPasswordLoadingState());
    final result = await authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
      otp: otp,
    );
    result.when(
      success: (data) {
        emit(ResetPasswordSuccessState(data: data));
      },
      failure: (failure) {
        emit(ResetPasswordErrorState(failure: failure));
      },
    );
  }
}
