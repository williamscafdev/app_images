enum HttpRequestFailure {
  network(503),
  notFound(504),
  server(500),
  unauthorized(401),
  badRequest(400),
  local(0);

  const HttpRequestFailure(this.statusCode);
  final int statusCode;
}
