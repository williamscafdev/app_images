/// A builder that recieve an [Input] and returns an [Output]
typedef ValueConverter<Input, Output> = Output Function(Input);

/// A builder that recieve an [Input] and returns a [Future<Output>]
typedef AsyncValueConverter<Input, Output> = Future<Output> Function(Input);
