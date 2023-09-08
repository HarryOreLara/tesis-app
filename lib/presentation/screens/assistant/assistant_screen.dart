import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/widgets/shared/message_field_box.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class AssistantScreen extends StatelessWidget {
  static const String name = 'assistant_screen';
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/home'); // Add this line to navigate back
          },
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
              ),
            ),
            SizedBox(width: 8.0),
            Text('Olivia'),
          ],
        ),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const HerMessageBubble()
                          : const MyMessageBubble();
                    })),

            /// Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
