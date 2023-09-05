import 'package:tesis_app/domain/datasources/auth/login_datasource_domain.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';
import 'package:tesis_app/domain/repositories/auth/login_repository_domain.dart';

class LoginRepositoryInfra extends LoginRepositoryDomain {
  final LoginDatasouceDomain loginDatasouceDomain;
  LoginRepositoryInfra(this.loginDatasouceDomain);

  @override
  Future<bool> loginUsuario(Usuario usuario) {
    return loginDatasouceDomain.loginUsuario(usuario);
  }
}
