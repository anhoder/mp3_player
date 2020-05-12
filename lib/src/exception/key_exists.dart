part of exception;

class KeyExistsException implements Exception {
  final String message;

  KeyExistsException([this.message]);

  @override
  String toString() => 'Key exists: ${message ?? ''}';
}