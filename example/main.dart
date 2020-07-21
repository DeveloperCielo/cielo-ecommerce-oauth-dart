import 'package:cielo_oauth/cielo_oauth.dart';

void main(List<String> arguments) async {
  var oauth = OAuth(
    clientId: "YOUR-CLIENT-ID",
    clientSecret: "YOUR-CLIENT-SECRET",
    environment: Environment.PRODUCTION,
  );
  var result = await oauth.getToken();

  if (result.accessTokenResponse != null)
    print("Access Token: ${result.accessTokenResponse.accessToken}");

  if (result.errorResponse != null)
    print("Error Description: ${result.errorResponse.errorDescription}");

  if (result.statusCode != null) print("Status Code: ${result.statusCode}");
}
