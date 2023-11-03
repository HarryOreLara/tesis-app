import 'package:dio/dio.dart';
import 'package:tesis_app/config/errors/exception.dart';
import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/persona_mapper.dart';
import 'package:tesis_app/infraestructure/models/profile/profile_model.dart';
import 'package:tesis_app/infraestructure/models/user/persona_response.dart';

import 'package:tesis_app/infraestructure/models/user/profile_response.dart';

class ProfileDatasourceInfra extends ProfileDatasourceDomain {
  AuthService authService = AuthService();

  Dio conexion(String token) {
    return Dio(BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json', 'x-auth-token': token}));
  }

  @override
  Future<bool> deletePersona(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> postNewPersona(ProfileModel profileModel) async {
    final tokenNullable = await authService.getToken();
    final token = tokenNullable ?? "";
    try {
      final profileJson = profileModel.toMap();
      final response =
          await conexion(token).post('/persona/post', data: profileJson);
      final res = ProfileResponse.fromJson(response.data);
      authService.savePersonaId(res.id);
      return res.ok;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<bool> updatPersona(String id) {
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> getOnePersona(String id) async {
    final tokenNullable = await authService.getToken();
    final token = tokenNullable ?? "";
    final response = await conexion(token).get('/persona/getPersonaIdUser/$id');
    final data = PersonaResponse.fromJson(response.data);
    final List<ProfileModel> listProfile = data.personaList;
    final ProfileModel profile =
        PersonaMapper.personaDbToEntity(listProfile[0]);
    return profile;
  }
}
