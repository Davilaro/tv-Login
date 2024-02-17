
//no es compatible con web 

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../services/remote/internet_checker.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;
  final InternetCheker _internetCheker;

  ConnectivityRepositoryImpl(
    this._connectivity, 
    this._internetCheker);

  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();//no es testeable se requiere inyeccion de dependecnias 
    if(result == ConnectivityResult.none){
      return false;
    }
    return _internetCheker.hasInternet();
  }

  
}  