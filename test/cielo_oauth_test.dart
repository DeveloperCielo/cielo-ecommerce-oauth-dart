import 'package:flutter_test/flutter_test.dart';

import 'package:cielo_oauth/cielo_oauth.dart';

void main() {
  group("correct credentials", () {
    AccessTokenResult result;
    setUp(() async {
      var oauth = OAuth(
          // TODO: PLACE YOUR CREDENTIALS HERE
          clientId: "YOUR-CLIENT-ID",
          clientSecret: "YOUR-CLIENT-SECRET",
          environment: Environment.SANDBOX);
      result = await oauth.getToken();
    });

    test('returns access token response', () {
      expect(result.accessTokenResponse, isNotNull);
    });

    test('returns access token', () {
      expect(result.accessTokenResponse.accessToken, isNotNull);
    });

    test('returns status code 201', () {
      expect(result.statusCode, isNotNull);
      expect(result.statusCode, 201);
    });

    test('returns null error response', () {
      expect(result.errorResponse, isNull);
    });
  });

  group("incorrect credentials", () {
    AccessTokenResult result;
    setUp(() async {
      var oauth = OAuth(
          clientId: "AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
          clientSecret: "9999999999999999999999999999999999999999999=",
          environment: Environment.SANDBOX);
      result = await oauth.getToken();
    });

    test('returns error response', () {
      expect(result.errorResponse, isNotNull);
    });

    test('returns error code', () {
      expect(result.errorResponse.error, isNotNull);
    });

    test('returns error description', () {
      expect(result.errorResponse.errorDescription, isNotNull);
    });

    test('returns null access token response', () {
      expect(result.accessTokenResponse, isNull);
    });

    test('returns status code different than 201', () {
      expect(result.statusCode, isNot(201));
    });
  });
}
