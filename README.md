# cielo_oauth

A Flutter package that helps to get oauth token to use on operations available on API REST of API Cielo eCommerce.

## Usage

These operations must be performed using its specific key (Client Id and Client Secret) in the respective environment endpoints.

```dart
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

if (result.statusCode != null)
    print("Status Code: ${result.statusCode}");
```