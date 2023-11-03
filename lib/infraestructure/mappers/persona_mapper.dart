
import 'package:tesis_app/infraestructure/models/profile/profile_model.dart';

class PersonaMapper {
  static ProfileModel personaDbToEntity(ProfileModel profile) => ProfileModel(
      id: profile.id,
      nombre: profile.nombre,
      apellidos: profile.apellidos,
      edad: profile.edad,
      genero: profile.genero,
      dni: profile.dni,
      idUsuario: profile.idUsuario);
}
