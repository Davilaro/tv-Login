import '../../domain/either/either.dart';
import '../../domain/enums.dart';
import '../../domain/failures/sign_in/http_request/http_request_failure.dart';
import '../../domain/models/media/media.dart';
import '../../domain/models/performer/performer.dart';
import '../../domain/repositories/trending_repository.dart';
import '../services/remote/trending_api.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  TrendingRepositoryImpl(this._trendingAPI);
  final TrendingAPI _trendingAPI;

  @override
  Future<Either<HttpRequestFaliure, List<Media>>> getMoviesAndSeries(
    TimeWindow timeWindow,
  ) {
    return _trendingAPI.getMovieAndSeries(
      timeWindow,
    );
  }

  @override
  Future<Either<HttpRequestFaliure, List<Performer>>> getPerformers() {
    return _trendingAPI.getPerformers(TimeWindow.day);
  }
}
