library cielo_oauth;

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'src/error_response.dart';
import 'src/access_token_response.dart';
import 'src/access_token_result.dart';
export 'src/access_token_result.dart';

enum Environment { SANDBOX, PRODUCTION }

class OAuth {
  final String clientId;
  final String clientSecret;
  final Environment environment;
  String _url;
  String _base64;

  OAuth({
    this.clientId,
    this.clientSecret,
    this.environment = Environment.SANDBOX,
  }) {
    if (environment == Environment.SANDBOX)
      this._url = 'https://meucheckoutsandbox.braspag.com.br/api/public/v2/token';
    else
      this._url = 'https://cieloecommerce.cielo.com.br/api/public/';

    var bytes = utf8.encode("$clientId:$clientSecret");
    this._base64 = base64Encode(bytes);
  }

  Future<AccessTokenResult> getToken() async {
    var response = await http.post(
      this._url,
      headers: <String, String>{'Authorization': 'Basic ${this._base64}'},
      body: <String, String>{'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 201) {
      return AccessTokenResult(
        accessTokenResponse: AccessTokenResponse.fromJson(jsonDecode(response.body)),
        statusCode: response.statusCode,
      );
    } else {
      return AccessTokenResult(
        errorResponse: ErrorResponse.fromJson(jsonDecode(response.body)),
        statusCode: response.statusCode,
      );
    }
  }
}
