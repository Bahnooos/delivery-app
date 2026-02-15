sealed class VerificationStates {}

class VerificationInitialState extends VerificationStates {}

class VerificationLoadingState extends VerificationStates {}

class VerificationSuccessState<T> extends VerificationStates {
  final T? data;

  VerificationSuccessState({this.data});
}

class VerificationErrorState extends VerificationStates {
  final String message;

  VerificationErrorState(this.message);
}
