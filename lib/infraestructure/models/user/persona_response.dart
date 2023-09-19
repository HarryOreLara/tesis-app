import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

class PersonaResponse {
  final bool ok;
  final List<Profile> personaList;

  PersonaResponse({required this.ok, required this.personaList});

  factory PersonaResponse.fromJson(Map<String, dynamic> json) =>
      PersonaResponse(
          ok: json["ok"] ?? '',
          personaList: (json["profile"] as List<dynamic>)
              .map((e) => Profile.fromJson(e))
              .toList());
}
