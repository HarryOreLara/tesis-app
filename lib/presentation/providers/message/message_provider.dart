import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/infraestructure/datasources/messages/chat_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/messages/chat_repository_infra.dart';

final messageRepositoryProvider = Provider((ref) {
  return ChatRepositoryInfra(ChatDatasourceInfra());
});