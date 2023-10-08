import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

class PersonaResponse {
  final bool ok;
  final List<Profile> personaList;

  PersonaResponse({required this.ok, required this.personaList});

  factory PersonaResponse.fromJson(DataMap json) {
    final profileList = json["persona"];
    if (profileList == null) {
      return PersonaResponse(ok: json["ok"] ?? false, personaList: []);
    }
    return PersonaResponse(
        ok: json["ok"] ?? '',
        personaList: (json["persona"] as List<dynamic>)
            .map((e) => Profile.fromJson(e))
            .toList());
  }
}
