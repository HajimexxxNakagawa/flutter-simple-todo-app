import 'package:flutter/material.dart';
import 'package:hello_world/components/primary_button.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/models/main_model.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';

class SignInOrSignUpScreen extends StatelessWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? 'assets/images/Logo_light.png'
                    : 'assets/images/Logo_dark.png',
                height: 146,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Sign In',
                press: () {},
              ),
              const SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: 'Sign Up',
                press: () {},
              ),
              const SizedBox(height: kDefaultPadding * 2),
              TextButton(
                onPressed: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChangeNotifierProvider<MainModel>(
                                create: (_) =>
                                    MainModel()..getTodoListRealTime(),
                                child: const HomeScreen(),
                              )));
                },
                child: const Text('Skip now'),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
