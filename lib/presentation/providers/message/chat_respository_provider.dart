import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/infraestructure/datasources/messages/conversaciones_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/messages/conversaciones_repository_infra.dart';

final chatRepositoryInfra = Provider((ref) {
  return ChatRepositoryInfra(ConversacionesDatasourceInfra());
});
