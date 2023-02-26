import 'package:flutter/material.dart';
import 'package:social_media/res/widgets/google_signin_button.dart';

class Home extends StatelessWidget {
  Home({super.key});

  bool _isAuth = false;

  buildAuthScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Before actually start to use the application make sure to connect with us using Google Sign in approach",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const GoogleSigninButton(),
          ],
        ),
      ),
    );
  }

  buildUnAuthScreen() {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isAuth ? buildUnAuthScreen() : buildAuthScreen(context);
  }
}
