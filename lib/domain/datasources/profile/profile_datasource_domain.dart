import 'package:tesis_app/infraestructure/models/profile/profile_model.dart';

abstract class ProfileDatasourceDomain {
  Future<bool> postNewPersona(ProfileModel profileModel);
  Future<bool> deletePersona(String id);
  Future<bool> updatPersona(String id);
  Future<ProfileModel> getOnePersona(String id);
}
