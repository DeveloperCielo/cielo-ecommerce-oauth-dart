import 'access_token_response.dart';
import 'error_response.dart';

class AccessTokenResult {
  AccessTokenResult({this.accessTokenResponse, this.errorResponse, this.statusCode});

  final AccessTokenResponse accessTokenResponse;
  final ErrorResponse errorResponse;
  final int statusCode;
}
