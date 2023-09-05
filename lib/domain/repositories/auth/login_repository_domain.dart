import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';

abstract class LoginRepositoryDomain {
  Future<bool> loginUsuario(Usuario usuario);
}
