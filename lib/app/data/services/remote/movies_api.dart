import '../../../domain/either/either.dart';
import '../../../domain/failures/sign_in/http_request/http_request_failure.dart';
import '../../../domain/models/movie/movie.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class MoviesApi {
  final Http _http;

  MoviesApi(this._http);

  Future<Either<HttpRequestFaliure, Movie>> getMovieById(int id) async {
    final result = await _http.request(
      '/movie/$id',
      onSuccess: (json) {
        return Movie.fromJson(json);
      },
    );
   
    

    return result.when(
      left: heandleHttpFailure,
      right: (movie) => Either.right(movie),
    );
  }
}
