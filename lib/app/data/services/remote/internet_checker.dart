

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class InternetCheker {
  Future<bool> hasInternet() async{
    try{
      if(kIsWeb){//kIsWeb es una constante boleana que permite ejecutar la app solo si es en web
        final response = await get(Uri.parse('google.com')
        );
        return response.statusCode == 200;

      }else{
        final list = await InternetAddress.lookup('google.com');// Puede generar error de tipo socket exception se requiere atrapar en bloque try catch
      print('hasInternet $list');
      return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
      
      }
      
    }catch (e) {
      print('=========${e.runtimeType}');//Internet adress lookap no esta soportada en web 
      return false;
    }
  }
}