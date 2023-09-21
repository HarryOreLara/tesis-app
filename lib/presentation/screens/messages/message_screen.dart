import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/domain/entities/messages/message_entitie.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/presentation/providers/delegates/search_person_delegate.dart';
import 'package:tesis_app/presentation/providers/message/message_provider.dart';

class MessageScreen extends ConsumerWidget {
  static const String name = 'message_screen';

  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Mensajes'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).go('/home');
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    final messageRepository =
                        ref.read(messageRepositoryProvider);
                    showSearch<Profile?>(
                            context: context,
                            delegate: SearchPersonDelegate(
                                searchPersonCallback:
                                    messageRepository.searchPerson))
                        .then((profile) {
                      if (profile == null) return;
                      GoRouter.of(context).go('/message/chat/${profile.id}/${profile.nombre}');
                    });
                  },
                  icon: const Icon(Icons.search)),
            ]),
        body: const _ListChats());
  }
}


//TODO: REARMAR DE NUEVO
class _ListChats extends StatelessWidget {
  const _ListChats();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final Message chat = chats[index];
        return GestureDetector(
          onTap: () {
            final senderJs = chat.sender;
            final user = senderJs.toJson();
            // context.push('/message/personas', extra: {'senderJson':senderJson});
            GoRouter.of(context).go('/message/personas', extra: user);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://img.allvipp.com/www-promipool-de/image/upload/w_580,f_webp,q_auto:eco/Liam_Neeson_His_Best_Roles_200604_gfgbns85i1'),
                  ),
                ),
                Container(
                  width: size.width * 0.65,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                chat.sender.nombre,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              chat.sender.isOnline
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Theme.of(context).primaryColor),
                                    )
                                  : Container(
                                      child: null,
                                    )
                            ],
                          ),
                          Text(
                            chat.time,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          chat.text,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
