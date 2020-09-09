class ErrorResponse {
  final String error;
  final String errorDescription;

  ErrorResponse({
    this.error,
    this.errorDescription,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: json['error'],
        errorDescription: json['error_description'],
      );
}
