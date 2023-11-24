import 'package:tesis_app/core/utils/typedef.dart';

class PuntuacionEstadoAnimo {
  final int enDesacuerdo;
  final int niAcuerdoNiDesacuerdo;
  final int ligeramenteAcuerdo;
  final int deAcuerdo;
  final int muyAcuerdo;
  final int totalAcuerdo;

  PuntuacionEstadoAnimo(
      {required this.enDesacuerdo,
      required this.niAcuerdoNiDesacuerdo,
      required this.ligeramenteAcuerdo,
      required this.deAcuerdo,
      required this.muyAcuerdo,
      required this.totalAcuerdo});

  factory PuntuacionEstadoAnimo.fromJson(DataMap json) => PuntuacionEstadoAnimo(
      enDesacuerdo: json["enDesacuerdo"],
      niAcuerdoNiDesacuerdo: json["niAcuerdoNiDesacuerdo"],
      ligeramenteAcuerdo: json["ligeramenteAcuerdo"],
      deAcuerdo: json["deAcuerdo"],
      muyAcuerdo: json["muyAcuerdo"],
      totalAcuerdo: json["totalAcuerdo"]);
}
