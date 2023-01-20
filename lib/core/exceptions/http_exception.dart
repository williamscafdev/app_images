class HttpException implements Exception {
  HttpException({
    this.title,
    this.message,
    this.statusCode,
    this.codeErrorFirebase,
  });

  final String? title;

  final String? message;

  final int? statusCode;
  final String? codeErrorFirebase;
}
