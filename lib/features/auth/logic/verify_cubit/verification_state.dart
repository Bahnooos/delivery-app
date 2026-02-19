import 'package:delivery_app/core/error/failure.dart';

sealed class VerificationStates {}

class VerificationInitialState extends VerificationStates {}

class VerificationLoadingState extends VerificationStates {}

class VerificationSuccessState<T> extends VerificationStates {
  final T? data;

  VerificationSuccessState({this.data});
}

class VerificationErrorState extends VerificationStates {
  final Failure failure;

  VerificationErrorState({required this.failure});
}
