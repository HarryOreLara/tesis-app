import 'package:dio/dio.dart';
import 'package:tesis_app/config/constants/enviroment.dart';
import 'package:tesis_app/domain/datasources/auth/login_datasource_domain.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/models/auth/auth_response.dart';

class LoginDatasouceInfra extends LoginDatasouceDomain {
  AuthService authService = AuthService();
  final dio = Dio(
    BaseOptions(
        baseUrl: Enviroment.apiUrl,
        headers: {'Content-Type': 'application/json'}),
  );

  @override
  Future<bool> loginUsuario(Usuario usuario) async {
    try {
      final usuarioJson = usuario.toJson();
      final response = await dio.post('/auth/login', data: usuarioJson);
      final res = AuthResponse.fromJson(response.data);
      authService.saveUserCredentials(res.token, res.id);
      return res.ok;
    } catch (e) {
      return false;
    }
  }
}
