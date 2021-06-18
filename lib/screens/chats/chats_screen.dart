import 'package:flutter/material.dart';
import 'package:hello_world/components/filled_outline_button.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/models/chat_model.dart';
import 'package:hello_world/screens/messages/message_screen.dart';

import 'components/chat_card.dart';

AppBar chatPageBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text('Chats'),
    actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
  );
}

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(
            kDefaultPadding, 0, kDefaultPadding, kDefaultPadding / 2),
        color: kPrimaryColor,
        child: Row(
          children: [
            FillOutlineButton(text: 'Recent', press: () {}),
            const SizedBox(
              width: kDefaultPadding / 2,
            ),
            FillOutlineButton(
              text: 'isActive',
              press: () {},
              isFilled: false,
            ),
          ],
        ),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                    chat: chatsData[index],
                    press: () {
                      Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessageScreen()));
                    },
                  )))
    ]);
  }
}

FloatingActionButton chatPageButton() {
  return FloatingActionButton(
    onPressed: () {},
    backgroundColor: kPrimaryColor,
    child: const Icon(
      Icons.person_add_alt_1,
      color: Colors.white,
    ),
  );
}
