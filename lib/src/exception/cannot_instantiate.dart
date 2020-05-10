part of exception;

class CannotInstantiateException implements Exception {
  final String message;

  CannotInstantiateException([this.message]);

  @override
  String toString() => 'Class Cannot be instantiated: ${message ?? ''}';
}