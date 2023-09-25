import 'package:tesis_app/domain/entities/cuestionario/puntuacion_depresion_entitie.dart';

class Depresion {
  final String id;
  final String contenido;
  final PuntuacionDepresion puntuacion;
  final List<String> items;
  final int numeroDocumento;

  Depresion(
      {required this.id,
      required this.contenido,
      required this.puntuacion,
      required this.items,
      required this.numeroDocumento});
}
