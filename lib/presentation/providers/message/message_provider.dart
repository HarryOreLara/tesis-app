import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/infraestructure/datasources/messages/message_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/messages/message_repository_infra.dart';

final messageRepositoryProvider = Provider((ref) {
  return MessageRepositoryInfra(MessageDatasourceInfra());
});
