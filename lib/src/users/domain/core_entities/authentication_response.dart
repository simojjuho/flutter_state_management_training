class AuthenticationResponse {
  final String accessToken;
  final String refreshToken;

  AuthenticationResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  static AuthenticationResponse parse(data) {
    return AuthenticationResponse(
      accessToken: data['access_token'],
      refreshToken: data['refresh_token'],
    );
  }
}
