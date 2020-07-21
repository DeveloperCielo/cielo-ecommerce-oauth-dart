class ErrorResponse {
  final String id;
  final String error;
  final String errorDescription;

  ErrorResponse({
    this.id,
    this.error,
    this.errorDescription,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        id: json["\u0024id"],
        error: json['error'],
        errorDescription: json['error_description'],
      );
}
