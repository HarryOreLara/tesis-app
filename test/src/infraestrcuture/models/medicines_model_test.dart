import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/medicines/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tMedicine = MedicineModel.empty();

  test('Deberia pertenecer a la entidad Medicine', () {
    expect(tMedicine, isA<Medicine>());
  });

  final tJson = fixture('medicine.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('Deberia retornar data exacta desde PersonaModel', () {
      final result = MedicineModel.fromMap(tMap);
      expect(result, equals(tMedicine));
    });
  });

  group('fromJson', () {
    test('Deberia retornar data de Medicine usando su funcion FromJson', () {
      final result = MedicineModel.fromJson(tJson);
      expect(result, equals(tMedicine));
    });
  });

  group('toMap', () {
    test('Deberia retornar un MAP con datos', () {
      final result = tMedicine.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('Deberia retornar un JSON con datos', () {
      final result = tMedicine.toJson();
      final tJson = jsonEncode({
        "_id": "1",
        "nombre": "_empty_nombre",
        "cantidadMedicamentos": "1",
        "horaInicio": "00:00",
        "horaIntermedio": "00:00",
        "horaFin": "00:00"
      });
      expect(result, tJson);
    });
  });

  group('CopyWIth', () {
    test('Deberia retornar una copia de MedicineModel', () {
      final result = tMedicine.copyWith(nombre: 'Amoxicilina');
      expect(result.nombre, 'Amoxicilina');
    });
  });
}
