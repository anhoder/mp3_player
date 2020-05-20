part of exception;

class KeyNotExistsException implements Exception {
  final String message;

  KeyNotExistsException([this.message]);

  @override
  String toString() => 'Key not exists: ${message ?? ''}';
}
