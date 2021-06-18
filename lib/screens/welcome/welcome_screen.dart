import 'package:flutter/material.dart';
import 'package:hello_world/screens/signInOrSignUp/signin_or_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset('assets/images/welcome_image.png'),
            const Spacer(flex: 3),
            Text(
              'Welcome to our \nMessaging and Todo App',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              'Nice colaboration experience with\n chat and task management',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64)),
            ),
            const Spacer(flex: 2),
            FittedBox(
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInOrSignUpScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.8),
                  ),
                  label: Text(
                    "Let's go!",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.8)),
                  )),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
