import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

class PersonitaReponse {
  final bool ok;
  final List<Profile> persona;

  PersonitaReponse({required this.ok, required this.persona});

  factory PersonitaReponse.fromJson(Map<String, dynamic> json) =>
      PersonitaReponse(
          ok: json["ok"] ?? '',
          persona: (json["persona"] as List<dynamic>)
              .map((e) => Profile.fromJson(e))
              .toList());
}
