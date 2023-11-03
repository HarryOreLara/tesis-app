import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/conversaciones/conversaciones_entitie.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tConversacion = ConversacionesModel.empty();

  test('Deberia ser una subclase de la entidad Chat', () {
    expect(tConversacion, isA<Conversaciones>());
  });

  final tJson = fixture('conversacion.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('Deberia retornar data verdadera desde ChatModel', () {
      final result = ConversacionesModel.fromMap(tMap);
      expect(result, equals(tConversacion));
    });
  });

  group('fromJson', () {
    test('Deberia retornar data de Medicine usando la funcion fromJson', () {
      final result = ConversacionesModel.fromJson(tJson);
      expect(result, equals(tConversacion));
    });
  });

  group('toMap', () {
    test('Deberia retornar un MAP con datos', () {
      final result = tConversacion.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('Deberia retornar un jSON con datos', () {
      final result = tConversacion.toJson();
      final tJson = jsonEncode({
        "idEmisor": "1",
        "idReceptor": "2",
        "nombreEmisor": "Harry",
        "nombreReceptor": "Myrian"
      });
      expect(result, tJson);
    });
  });

  group('Copy With', () {
    test('Deberia retornar una copia de ConversacionesModel', () {
      final result = tConversacion.copyWith(nombreEmisor: 'Harry');
      expect(result.nombreEmisor, 'Harry');
    });
  });
}
