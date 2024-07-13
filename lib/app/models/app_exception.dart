import 'package:equatable/equatable.dart';

// ignore_for_file: lines_longer_than_80_chars

class AppException extends Equatable {
  const AppException({
    required this.message,
    this.data,
  });
  final String message;
  final dynamic data;

  @override
  String toString() {
    return 'AppException{message: $message, data: $data}';
  }

  @override
  List<Object?> get props => [message, data];
}

/// This is not to be used freely, it should be used as a fallback for errors
/// that need to be handled, especially for the API service where we don't know
/// all the errors beforehand.
class UnknownException extends AppException {
  const UnknownException({
    super.data,
    super.message =
        "Oops! App encountered an issue. We're on it. Please try again later or contact us.",
  });
}

/// Errors that come from API calls that return error codes 500 and above
class InternetException extends AppException {
  const InternetException({
    super.data,
    super.message = 'Please check your internet connection and try again.',
  });
}

/// Errors that come from API calls that return error codes 500 and above
class ServerException extends AppException {
  const ServerException({
    super.data,
    super.message =
        "Sorry, we're having trouble on our end. Please try again later or contact support for assistance.",
  });
}

/// Errors that come from serializing data
class ObjectParserException extends AppException {
  const ObjectParserException({
    super.message = 'An error occurred while parsing data. Please try again.',
    super.data,
    this.stackTrace,
  });
  final StackTrace? stackTrace;
}

class CoreException extends AppException {
  const CoreException({
    super.message =
        'Sorry, we had an issues setting up things for you. Please contact support!',
    super.data,
  });
}

/// This is not to be used freely, it should be used as a fallback for errors
/// that need to be handled, especially for the API service where we don't know
/// all the errors beforehand.
class FallbackException extends AppException {
  const FallbackException({
    super.data,
    super.message =
        "Oops! App encountered an issue. We're on it. Please try again later or contact us.",
  });
}
