import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

abstract class ProfileDatasourceDomain {
  Future<bool> postNewPersona(Profile profile);
  Future<bool> deletePersona(String id);
  Future<bool> updatPersona(String id);
  Future<Profile> getOnePersona(String id);
}
