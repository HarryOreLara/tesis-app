import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/domain/repositories/profile/profile_repository_domain.dart';

class ProfileRepositoryInfra extends ProfileRepositoryDomain {
  final ProfileDatasourceDomain profileDatasourceDomain;

  ProfileRepositoryInfra({required this.profileDatasourceDomain});

  @override
  Future<bool> deletePersona(String id) {
    return profileDatasourceDomain.deletePersona(id);
  }

  @override
  Future<bool> postNewPersona(Profile profile) {
    return profileDatasourceDomain.postNewPersona(profile);
  }

  @override
  Future<bool> updatPersona(String id) {
    return profileDatasourceDomain.updatPersona(id);
  }
}
