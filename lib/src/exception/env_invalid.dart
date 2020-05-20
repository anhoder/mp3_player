part of exception;

class EnvInvalidException implements Exception {
  final String message;

  EnvInvalidException([this.message]);

  @override
  String toString() => 'Env invalid: ${message ?? ''}';
}
