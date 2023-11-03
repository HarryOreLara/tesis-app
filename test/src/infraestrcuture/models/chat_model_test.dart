import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/chat/chat_entitie.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tChat = ChatModel.empty();

  test('Deberia ser una subclase de la entidad Chat', () {
    expect(tChat, isA<Chat>());
  });

  final tJson = fixture('chat.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('Deberia retornar data verdadera desde ChatModel', () {
      final result = ChatModel.fromMap(tMap);
      expect(result, equals(tChat));
    });
  });

  group('fromJson', () {
    test('Deberia retornar data de Medicina usando la funcion FromJson', () {
      final result = ChatModel.fromJson(tJson);
      expect(result, equals(tChat));
    });
  });

  group('toMap', () {
    test('Deberia retornar un JSON con datos', () {
      final result = tChat.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('Deberia returnar un JSON con datos', () {
      final result = tChat.toJson();
      final tJson = jsonEncode({
        "_id": "1",
        "emisor": "1",
        "receptor": "2",
        "mensaje": "_empty_mensaje",
        "leido": true,
        "createdAt": "2023-11-02 08:28:00"
      });
      expect(result, tJson);
    });
  });

  group('Copy With', () {
    test('Deberia retornar una copia de ChatModel', () {
      final result = tChat.copyWith(mensaje: 'Hola Mundo');
      expect(result.mensaje, 'Hola Mundo');
    });
  });
}
