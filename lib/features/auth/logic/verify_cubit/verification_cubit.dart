import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:delivery_app/features/auth/data/models/verify_email_request_body.dart';
import 'package:delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCubit extends Cubit<VerificationStates> {
  VerificationCubit({required this.authRepo, required this.tokenStorage})
    : super(VerificationInitialState());
  final AuthRepo authRepo;
  final TokenStorage tokenStorage;

  Future<void> emitVerificationStates({
    required String? email,
    required String? otp,
  }) async {
    emit(VerificationLoadingState());
    final response = await authRepo.verify(
      verifyEmailRequestBody: VerifyEmailRequestBody(
        email: email ?? '',
        otp: otp ?? '',
      ),
    );
    response.when(
      success: (data) async {
        if (data.accessToken == null || data.refreshToken == null) {
          emit(VerificationErrorState('Invalid Authentication response'));
          return;
        }
        await tokenStorage.saveTokens(
          accessToken: data.accessToken ?? '',
          refreshToken: data.refreshToken ?? '',
        );

        emit(VerificationSuccessState(data: data));
      },
      failure: (error) => emit(VerificationErrorState(error)),
    );
  }
}
