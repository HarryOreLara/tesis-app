import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/domain/repositories/profile/profile_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/profile/profile_model.dart';

class ProfileRepositoryInfra extends ProfileRepositoryDomain {
  final ProfileDatasourceDomain profileDatasourceDomain;

  ProfileRepositoryInfra(this.profileDatasourceDomain);

  @override
  Future<bool> deletePersona(String id) {
    return profileDatasourceDomain.deletePersona(id);
  }

  @override
  Future<bool> postNewPersona(ProfileModel profileModel) {
    return profileDatasourceDomain.postNewPersona(profileModel);
  }

  @override
  Future<bool> updatPersona(String id) {
    return profileDatasourceDomain.updatPersona(id);
  }

  @override
  Future<ProfileModel> getOnePersona(String id) {
    return profileDatasourceDomain.getOnePersona(id);
  }
}
