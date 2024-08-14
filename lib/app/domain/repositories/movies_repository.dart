import '../either/either.dart';
import '../failures/sign_in/http_request/http_request_failure.dart';
import '../models/movie/movie.dart';

abstract class MoviesRepository {
  Future<Either<HttpRequestFaliure, Movie>> getMovieById(int id);
}
