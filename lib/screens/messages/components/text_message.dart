import 'package:flutter/material.dart';
import 'package:hello_world/models/ChatMessage.dart';

import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: message.isSender
              ? kPrimaryColor
              : kPrimaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        message.text,
        style: TextStyle(
            color: message.isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1!.color),
      ),
    );
  }
}
