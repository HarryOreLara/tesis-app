import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'respuestas_forum_state.dart';

class RespuestasForumCubit extends Cubit<RespuestasForumState> {
  RespuestasForumCubit() : super(RespuestasForumInitial());
}
