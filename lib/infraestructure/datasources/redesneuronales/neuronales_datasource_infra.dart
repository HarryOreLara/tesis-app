import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/redesneuronales/neuronales_datasource_domain.dart';
import 'package:tesis_app/domain/entities/redesneuronales/neurona.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';

class NeuronalesDatasourceInfra extends NeuronalesDatasourceDomain {
  Dio nuevo(String token) {
    return Dio(BaseOptions(
        // baseUrl: 'https://tesis-xz3b.onrender.com',
        baseUrl: 'http://127.0.0.1:5000',
        headers: {'Content-Type': 'application/json', 'x-auth-token': token}));
  }

  @override
  Future<void> createAnalisis(Neurona neurona) async {
    final authService = AuthService();
    final tokenNullable = await authService.getToken();
    final token = tokenNullable ?? "";
    final neuronaJson = neurona.toJson();
    await nuevo(token).post("/analisis", data: neuronaJson);
  }
}
