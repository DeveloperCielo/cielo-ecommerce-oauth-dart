class AccessTokenResponse {
  AccessTokenResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String accessToken;
  String tokenType;
  int expiresIn;

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      AccessTokenResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );
}
