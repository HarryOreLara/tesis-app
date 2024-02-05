import 'package:dio/dio.dart';
import 'package:tesis_app/config/constants/enviroment.dart';
import 'package:tesis_app/domain/datasources/auth/register_datasourcer_domain.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/models/auth/auth_response.dart';
import 'package:tesis_app/infraestructure/repositories/profile/profile_reposiroty_infra.dart';

class RegisterDatasourceInfra extends RegisterDatasourceDomain {
  AuthService authService = AuthService();
  ProfileRepositoryInfra profileRepositoryInfra =
      ProfileRepositoryInfra(ProfileDatasourceInfra());
  final dio = Dio(BaseOptions(
      baseUrl: Enviroment.apiUrl,
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<bool> registerUsuario(Usuario usuario) async {
    try {
      final usuarioJson = usuario.toJson();
      final response = await dio.post('/auth/register', data: usuarioJson);
      final res = AuthResponse.fromJson(response.data);
      authService.saveUserCredentials(res.token, res.id);
      return res.ok;
    } catch (e) {
      return false;
    }
  }

}
