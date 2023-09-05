import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';

abstract class RegisterRepositoryDomain {
  Future<bool> registerUsuario(Usuario usuario);
}
