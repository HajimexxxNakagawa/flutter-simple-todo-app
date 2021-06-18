import 'package:flutter/material.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/models/chat_message.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: message.isSender
              ? kPrimaryColor
              : kPrimaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : kPrimaryColor,
          ),
          Expanded(
              child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 2,
                color: kPrimaryColor.withOpacity(0.4),
              ),
              Positioned(
                  left: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                        color: kPrimaryColor, shape: BoxShape.circle),
                  )),
            ],
          )),
          const Text(
            '0:37',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
