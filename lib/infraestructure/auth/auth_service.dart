import 'package:shared_preferences/shared_preferences.dart';

class AuthService{


// Guardar datos al iniciar sesión
void saveUserCredentials(String token, String userId) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
  prefs.setString('userId', userId);
}

// Obtener datos cuando sea necesario
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<String?> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userId');
}



// Borrar datos al cerrar sesión
void clearUserCredentials() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('userId');
}

}