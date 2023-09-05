import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';

abstract class RegisterDatasourceDomain {
  Future<bool> registerUsuario(Usuario usuario);
}
