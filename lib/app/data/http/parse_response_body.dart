part of 'http.dart';
//Crear una funcion para convertir el responseBody que llega como String
dynamic _parseResponseBody(String responseBody) {
  try {
    return jsonDecode(responseBody);
  } catch (_) {
    return responseBody;
  }
}