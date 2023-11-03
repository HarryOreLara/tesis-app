import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/models/profile/profile_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tProfile = ProfileModel.empty();
  test('Deberia pertenecer a la entidad profile', () {
    expect(tProfile, isA<Profile>());
  });

  final tJson = fixture('profile.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('Deberia retornar data exacta desde personaModel', () {
      final result = ProfileModel.fromMap(tMap);
      expect(result, equals(tProfile));
    });
  });

  group('fromJson', () {
    test('Deberia retornar data de ProfileModel usando la funcion FromJson',
        () {
      final result = ProfileModel.fromJson(tJson);
      expect(result, equals(tProfile));
    });
  });

  group('toMap', () {
    test('Deberia retornar un MAP con datos', () {
      final result = tProfile.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('Deberia retornar un JSON con datos', () {
      final result = tProfile.toJson();
      final tJson = jsonEncode({
        "_id": "1",
        "nombre": "_empty_nombre",
        "apellidos": "_empty_appelidos",
        "edad": "_empty_edad",
        "genero": "_empty_genero",
        "dni": "_empty_dni",
        "idUsuario": "1"
      });
      expect(result, tJson);
    });
  });

  group('Copy With', () {
    test('Deberia retornar una copia de ProfileModel', () {
      final result = tProfile.copyWith(nombre: 'Harry');
      expect(result.nombre, 'Harry');
    });
  });
}
