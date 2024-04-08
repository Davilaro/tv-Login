import '../either/either.dart';
import '../enums.dart';
import '../failures/sign_in/http_request/http_request_failure.dart';
import '../models/media/media.dart';
import '../models/performer/performer.dart';

abstract class TrendingRepository {
  Future<Either<HttpRequestFaliure, List<Media>>> getMoviesAndSeries(
    TimeWindow timeWindow,
  );

  Future<Either<HttpRequestFaliure, List<Performer>>> getPerformers();
}
