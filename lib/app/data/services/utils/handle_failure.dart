import '../../../domain/either/either.dart';
import '../../../domain/failures/sign_in/http_request/http_request_failure.dart';
import '../../http/http.dart';

Either<HttpRequestFaliure, R> heandleHttpFailure<R>(HttpFailure httpFailure) {
  //print('&&&&&&&&&&&&& null    ${httpFailure.exception}');
   print('&&&&&&&&&&&&&  null 2   ${httpFailure.statusCode}');
  final failure = () {
    final statusCode = httpFailure.statusCode;
    switch (statusCode) {
      case 404:
        return HttpRequestFaliure.notFound();
      case 401:
        return HttpRequestFaliure.unauthorized();
    }
    // if (httpFailure.exception is NetworkException) {
    //   return HttpRequestFaliure.network();
    // }
    return HttpRequestFaliure.unknown();
  }();
  return Either.left(failure);
}
