class AccessTokenResponse {
  AccessTokenResponse({
    this.id,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String id;
  String accessToken;
  String tokenType;
  String expiresIn;

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) => AccessTokenResponse(
        id: json["\u0024id"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );
}
