import '../../../domain/either/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/failures/sign_in/http_request/http_request_failure.dart';
import '../../../domain/models/media/media.dart';
import '../../../domain/models/performer/performer.dart';
import '../../../domain/typedefs.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class TrendingAPI {
  final Http _http;

  TrendingAPI(this._http);

  Future<Either<HttpRequestFaliure, List<Media>>> getMovieAndSeries(
    TimeWindow timeWindow,
  ) async {
    final result = await _http.request(
      '/trending/all/${timeWindow.name}',
      onSuccess: (json) {
         print('JSON retornado por la APIIIIIIIIIII: $json');

        final list = List<Json>.from(json['results']);
        return list
            .where(
              (e) => e['media_type'] != 'person',
            )
            .map((e) => Media.fromJson(e))
            .toList();
      },
    );
    return result.when(
      left: heandleHttpFailure,
      right: (list) => Either.right(list),
    );
  }

  Future<Either<HttpRequestFaliure, List<Performer>>> getPerformers(
    TimeWindow timeWindow,
  ) async {
    final result = await _http.request(
      '/trending/person/${timeWindow.name}',
      onSuccess: (json) {
        
        final list = List<Json>.from(json['results']);
        return list
            .where(
              (e) => 
                  e['known_for_department'] == 'Acting' &&
                  e['profile_path'] != null,
            )
            .map((e) => Performer.fromJson(e))
            .toList();
      },
    );
    return result.when(
      left: heandleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
