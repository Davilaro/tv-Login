
import '../../../domain/models/user/user.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../state_notifier.dart';
//Esta clase manejara el estado global del usuario 
class SessionController extends StateNotifier <User?> {
  SessionController({required this.authenticationRepository
  }): super(null);

  final AuthenticationRepository authenticationRepository;

//Define o actualiza los datos del usuario es decir nunca sera null
  void setUser (User user) {
    state = user;
  }

  Future <void> signOut()async{
  await  authenticationRepository.signOut();
    onlyUpdate(null);
  }
}