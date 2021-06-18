import 'package:flutter/material.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/models/chat_message.dart';
import 'audio_message.dart';
import 'chat_input_field.dart';
import 'text_message.dart';
import 'video_message.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => Message(
                      message: demeChatMessages[index],
                    )),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;

  Widget messageContaint(ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return TextMessage(message: message);
      case ChatMessageType.audio:
        return AudioMessage(message: message);
      case ChatMessageType.video:
        return VideoMesage(message: message);
      case ChatMessageType.image:
        return VideoMesage(message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(radius: 12, child: Icon(Icons.person)),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          messageContaint(message),
        ],
      ),
    );
  }
}
