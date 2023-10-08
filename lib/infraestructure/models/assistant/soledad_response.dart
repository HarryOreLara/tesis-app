import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/cuestionario/soledad_entitie.dart';

class SoledadResponse {
  final Soledad soledad;

  SoledadResponse({required this.soledad});

  factory SoledadResponse.fromJson(DataMap json) =>
      SoledadResponse(soledad: json["soledad"] ?? '');

  Map<String, dynamic> toJson() => {"soledad": soledad};
}
