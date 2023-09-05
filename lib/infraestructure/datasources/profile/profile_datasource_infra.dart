import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/models/user/profile_response.dart';

class ProfileDatasourceInfra extends ProfileDatasourceDomain {
  Dio nuevo(String token) {
    return Dio(BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json', 'x-auth-token': token}));
  }

  @override
  Future<bool> deletePersona(String id) {
    // TODO: implement deletePersona
    throw UnimplementedError();
  }

  @override
  Future<bool> postNewPersona(Profile profile) async {
    final authService = AuthService();
    final tokenNullable = await authService.getToken();
    final token = tokenNullable ?? "";
    try {
      final profileJson = profile.toJson();
      final response =
          await nuevo(token).post('/persona/post', data: profileJson);
      final res = ProfileResponse.fromJson(response.data);
      return res.ok;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updatPersona(String id) {
    // TODO: implement updatPersona
    throw UnimplementedError();
  }
}
