import '../../../domain/models/user/user.dart';
import '../../http/http.dart';

class AccountAPI {
  AccountAPI(this._http);
  final Http _http; //Necesita una instancia de http que hace el llamado a la Api

  Future<User?> getAccount(String sessionId) async {
    final result = await _http.request(
      '/account',
      queryParameters: {
        'session_id': sessionId,
      },
      onSuccess: (json) {
        return User.fromJson(json);
      },
    );
    return result.when(
     left:  (_) => null,
    right:  (user) => user,
    );
  }
}
