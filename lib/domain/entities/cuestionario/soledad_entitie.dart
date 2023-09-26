import 'package:tesis_app/domain/entities/cuestionario/puntuacion_soledad_entitie.dart';

class Soledad {
  final String id;
  final String contenido;
  final PuntuacionSoledad puntuacion;
  final List<String> items;
  final int numeroDocumento;

  Soledad(
      {required this.id,
      required this.contenido,
      required this.puntuacion,
      required this.items,
      required this.numeroDocumento});
}
