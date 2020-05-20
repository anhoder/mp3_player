part of exception;

class DataTypeInvalidException implements Exception {
  final String message;

  DataTypeInvalidException([this.message]);

  @override
  String toString() => 'Data type error: ${message ?? ''}';
}