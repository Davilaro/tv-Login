import '../../domain/either/either.dart';
import '../../domain/failures/sign_in/http_request/http_request_failure.dart';
import '../../domain/models/movie/movie.dart';
import '../../domain/repositories/movies_repository.dart';
import '../services/remote/movies_api.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MoviesApi _moviesAPI;

  MovieRepositoryImpl(this._moviesAPI);

  @override
  Future<Either<HttpRequestFaliure, Movie>> getMovieById(int id) {
    return _moviesAPI.getMovieById(id);
  }
}
