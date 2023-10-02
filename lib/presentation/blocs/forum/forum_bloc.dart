import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:meta/meta.dart';

part 'forum_event.dart';
part 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  ForumBloc() : super(const ForumInitialState()) {

    on<AddForum>((event, emit) {
      emit(ForumSetState(event.newForum));
    });
  }
}
