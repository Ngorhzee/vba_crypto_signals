import 'failure.dart';
import 'dart:developer';

import 'package:dio/dio.dart';

class BadRequestException extends DioException with Failure {
  BadRequestException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => serverResponse?.data?["message"] ?? "Invalid request";

  @override
  String get title => "an error occured";
}

/// 500
class InternalServerErrorException extends DioException with Failure {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Unknown error occurred, please try again later.";

  @override
  String get title => "Server error";
}

/// 409
class ConflictException extends DioException with Failure {
  ConflictException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message =>
      serverResponse?.data?["message"] ?? "Conflict occurredd.";

  @override
  String get title => "Network error";
}

/// 401
class UnauthorizedException extends DioException with Failure {
  UnauthorizedException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => serverResponse?.data?["message"] ?? "Invalid request";
  @override
  String get title => "Access denied";
}

/// 404
class NotFoundException extends DioException with Failure {
  NotFoundException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message =>
      serverResponse?.data?["message"] ?? "Not Found, please try again.";

  // @override
  // String get message => "Not Found, please try again.";

  @override
  String get title => "Not Found";
}

/// No Internet
class NoInternetConnectionException extends DioException with Failure {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "No internet connection, please try again.";

  @override
  String get title => "Network error";
}

/// Connnection timeout
class DeadlineExceededException extends DioException with Failure {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Connection Timeout, please try again.";

  @override
  String get title => "Network error";
}

///Server Error
class ServerCommunicationException extends DioException with Failure {
  ServerCommunicationException(this.r)
      : super(requestOptions: r!.requestOptions);

  /// sustained so that the data sent by the server can be gotten to construct message
  final Response? r;

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message {
    try {
      log(r?.data?.toString() ?? "");
      return getMessagefromServer(r?.data ?? {"message": "Server Error"});
    } catch (e) {
      return "Something went wrong";
    }
  }
  // eddietonsagie@gmail.com

  @override
  String get title => "Network error";
}

class UserDefinedException with Failure {
  UserDefinedException({
    String message = "An Error Occured",
    String title = "Error",
  })  : _message = message,
        _title = title;

  final String _message;
  final String _title;

  @override
  // TODO: implement message
  String get message => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}
