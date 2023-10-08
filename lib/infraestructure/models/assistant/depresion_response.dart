import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/cuestionario/depresion_entitie.dart';

class DepresionResponse {
  final Depresion depresion;

  DepresionResponse({required this.depresion});

  factory DepresionResponse.fromJson(DataMap json) =>
      DepresionResponse(depresion: json["depresion"] ?? '');

  Map<String, dynamic> toJson() => {"depresion": depresion};
}
