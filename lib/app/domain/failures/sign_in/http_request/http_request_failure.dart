

import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';


@freezed
class HttpRequestFaliure with _$HttpRequestFaliure {

  factory HttpRequestFaliure.notFound() = HttpRequestFaliureNotFound;
  factory HttpRequestFaliure.network() = HttpRequestFaliureNetwork;
  factory HttpRequestFaliure.unauthorized() = HttpRequestFaliureUnauthorized;
  factory HttpRequestFaliure.unknown() = HttpRequestFailureUnknown;
}
