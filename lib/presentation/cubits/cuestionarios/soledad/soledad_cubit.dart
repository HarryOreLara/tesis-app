import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/cuestionarios/soledad_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/cuestionarios/soledad_repository_infra.dart';

part 'soledad_state.dart';

class SoledadCubit extends Cubit<SoledadState> {
  SoledadCubit() : super(const SoledadState());
  AuthService authService = AuthService();

  SoledadRepositoryInfra soledadRepositoryInfra =
      SoledadRepositoryInfra(SoledadDatasourceInfra());

  List<PreguntasPuntuadasSoledad> preguntasPuntuadas = [];

  bool enviarRespuestaSoledad(
      String idPregunta, String contenido, String respuesta) {
    final respuestasAcumuladas = PreguntasPuntuadasSoledad(
        idPregunta: idPregunta, contenido: contenido, respuesta: respuesta);
    preguntasPuntuadas.add(respuestasAcumuladas);
    if (validar() == true) {
      soledadRepositoryInfra.sendRespuestaSoledad(preguntasPuntuadas);
      return true;
    } else {
      return false;
    }
  }

  bool validar() {
    final numeracion = preguntasPuntuadas.length;
    if (numeracion > 19) {
      return true;
    } else {
      return false;
    }
  }
}
