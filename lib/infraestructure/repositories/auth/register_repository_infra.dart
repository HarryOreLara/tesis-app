import 'package:tesis_app/domain/datasources/auth/register_datasourcer_domain.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';
import 'package:tesis_app/domain/repositories/auth/register_reposiotry_domain.dart';

class RegisterRepositoryInfra extends RegisterRepositoryDomain {
  final RegisterDatasourceDomain registerDatasourceDomain;
  RegisterRepositoryInfra(this.registerDatasourceDomain);

  @override
  Future<bool> registerUsuario(Usuario usuario) {
    return registerDatasourceDomain.registerUsuario(usuario);
  }
}
