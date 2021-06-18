import 'package:flutter/material.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/screens/messages/components/body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const BackButton(),
            const CircleAvatar(),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Person name',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'active 3min ago',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
      body: const Body(),
    );
  }
}
