import 'package:delivery_app/core/helpers/shared_pref_helper.dart';

abstract class TokenStorage {
  Future<String?> getAcessToken();
  Future<String?> getRefreshToken();
  Future<void> saveTokens({required String accessToken, required String refreshToken});
  Future<void> clear();
}

class SecureTokenStorage implements TokenStorage {
  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';
  @override
  Future<void> clear() async {
    await SharedPrefHelper.removeData(key: _accessKey);
    await SharedPrefHelper.removeData(key: _refreshKey);
  }

  @override
  Future<String?> getAcessToken() async {
    final accessToken = await SharedPrefHelper.getSecureData(key: _accessKey);
    return accessToken.isEmpty ? null : accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    final refreshToken = await SharedPrefHelper.getSecureData(key: _refreshKey);
    return refreshToken.isEmpty ? null : refreshToken;
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await SharedPrefHelper.setSecureData(key: _accessKey, value: accessToken);
    await SharedPrefHelper.setSecureData(key: _refreshKey, value: refreshToken);
  }
}
