import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';

abstract class LoginDatasouceDomain {
  Future<bool> loginUsuario(Usuario usuario);
}
