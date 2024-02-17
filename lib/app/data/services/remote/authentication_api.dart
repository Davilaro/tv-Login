
import '../../../domain/either.dart';
import '../../../domain/enums.dart';
import '../../http/http.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._http);

  final Http _http;
  //final _baseUrl = 'https://api.themoviedb.org/3';
  //final _apiKey = '4644b868b12e5212e78ae7bfb4c84e30';

  //Esta funcion se crea para reutilizarse en todos los failure
  Either<SignInFailure, String> _handleFailure(HttpFailure failure) {
    if (failure.statusCode != null) {
      print('🐶 failure.statusCode ${failure.statusCode}');
      switch (failure.statusCode!) {
        case 401: //Para contrase;a invalida
          return Either.left(SignInFailure.unauthorized);
        case 404: //Username invalido
          return Either.left(SignInFailure.notFound);
        default:
          return Either.left(SignInFailure.unknown);
      }
    }

    if (failure.exception is NetworkException) {
      return Either.left(SignInFailure.netWork);
    }
    return Either.left(SignInFailure.unknown);
  }

  Future<Either<SignInFailure, String>> createRequestToken() async {
    final result = await _http.request(
      '/authentication/token/new',
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['request_token'] as String;
      },
    );
    return result.when(
        _handleFailure,
        (requesToken) => Either.right(
              requesToken,
            ));
  }

  Future<Either<SignInFailure, String>> createSessionWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final result = await _http.request(
      '/authentication/token/validate_with_login',
      method: HttpMethod.post,
      body: {
        'username': username,
        'password': password,
        'request_token': requestToken,
      },
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['request_token'] as String;
      },
    );

    return result.when(
      _handleFailure,
      (newRequestToken) => Either.right(
        newRequestToken,
      ),
    );
  }

  Future<Either<SignInFailure, String>> createSession(
      String requestToken) async {
    final result = await _http.request(
      '/authentication/session/new', 
      method: HttpMethod.post, 
      body: {
      'request_token': requestToken,
    }, 
    onSuccess: (responseBody) {
      final json = responseBody as Map;
      return json['session_id'] as String;
    });

    return result.when(
        _handleFailure,
        (sessionId) => Either.right(
          sessionId,
          ),
        );
  }
}
