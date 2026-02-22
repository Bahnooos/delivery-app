class ApiConstant {
  static const String baseUrl = 'http://food-delivery.tryasp.net/api';
  static const String signUpEndpoint = '/Authentication/register';
  static const String loginEndpoint = '/Authentication/login';
  static const String facebookEndpoint = '/Authentication/external/facebook';
  static const String googleEndpoint = '/Authentication/external/google';
  static const String verifyEndpoint = '/Authentication/verifyEmail';
  static const String resendVCodeEndpoint = '/Authentication/resend-v-code';
  static const String refreshEndpoint = '/Authentication/refresh';
  static const String resetPasswordEndpoint = '/Authentication/reset-password';
  static const String forgotPasswordEndpoint =
      '/Authentication/forgot-password';
}
