import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

class PersonitaMapper {
  static Profile personaDbToEntity(Profile profile) => Profile(
      id: profile.id,
      nombre: profile.nombre,
      apellidos: profile.apellidos,
      edad: profile.edad,
      genero: profile.genero,
      dni: profile.dni);
}
