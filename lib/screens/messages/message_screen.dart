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
            BackButton(),
            CircleAvatar(),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
      body: Body(),
    );
  }
}
