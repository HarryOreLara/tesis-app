import 'package:tesis_app/domain/entities/cuestionario/soledad_entitie.dart';

class SoledadResponse {
  final Soledad soledad;

  SoledadResponse({required this.soledad});

  factory SoledadResponse.fromJson(Map<String, dynamic> json) =>
      SoledadResponse(soledad: json["soledad"] ?? '');

  Map<String, dynamic> toJson() => {"soledad": soledad};
}
