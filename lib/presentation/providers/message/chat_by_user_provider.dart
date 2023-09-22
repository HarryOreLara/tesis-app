import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';

// final chatSaveProvider =
//     StateNotifierProvider< Map<String, Chats>>((ref) {
//   final chatRepository = ref.watch(chatRepositoryInfra);
//   return chatRepository.saveChat;
// });

typedef SaveChatsCallback = Future<Chats> Function(String iReceptor);

class ChatByUserNotifier extends StateNotifier<Map<String, Chats>> {
  final SaveChatsCallback saveChat;

  ChatByUserNotifier({required this.saveChat}) : super({});

  Future<void> saveOneChat(String idReceptor) async {
    if (state[idReceptor] != null) return;
    final chat = await saveChat(idReceptor);
    state = {...state, idReceptor: chat};
  }
}
