import '../either.dart';
import '../failures/sign_failure/sign_in_failure.dart';
import '../models/user/user.dart';
  //Definir funcion para que un usuario pueda logearse
  //Esta funcion debe retornar un future porque realizara
  //una peticion a una api y requiere unos minutos para hacerlo
  //Se usara la clase Either para usar programacion funcional y usar los datos genericos
  //lefth para indicar que la solicitud no fue posible, y right para indicar que fue exitosa

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future <void> signOut(); //Paso 3 definir el metodo 
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  );
}
