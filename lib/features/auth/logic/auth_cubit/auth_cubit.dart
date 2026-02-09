import 'package:delivery_app/core/networking/auth/auth_event_bus.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:delivery_app/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthEventBus authEventBus;
  final TokenStorage tokenStorage;
  AuthCubit({required this.authEventBus, required this.tokenStorage}) : super(AuthInitial()) {
    authEventBus.stream.listen((event) {
      if (event == AuthEvent.logout) {
        emit(AuthUnauthenticated());
      }
    });
    checkAuth();
  }

  Future<void> checkAuth() async {
    final accessToken = await tokenStorage.getAcessToken();
    emit(accessToken != null ? AuthAuthenticated() : AuthUnauthenticated());
  }
}
