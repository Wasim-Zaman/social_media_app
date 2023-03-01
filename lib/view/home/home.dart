import 'package:flutter/material.dart';
import 'package:social_media/res/color.dart';
import 'package:social_media/res/widgets/google_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home-screen';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool _isAuth = false;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account!);
    }, onError: (err) {
      print('Error signing in: $err');
      setState(() {
        _isAuth = false;
      });
    });

    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account!);
    }).catchError((err) {
      print('Error signing in: $err');
      setState(() {
        _isAuth = false;
      });
    });
  }

  signIn() {
    googleSignIn.signIn();
  }

  signOut() {
    googleSignIn.signOut();
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print('User signed in!: $account');
      setState(() {
        _isAuth = true;
      });
    } else {
      print('User signed out!');
      setState(() {
        _isAuth = false;
      });
    }
  }

  buildAuthScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Screen"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: AppColors.secondaryColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(500),
            bottomRight: Radius.circular(500),
          ),
          gradient: const RadialGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GoogleSigninButton(
                onTap: signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildUnAuthScreen() {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("UnAuth Screen"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isAuth ? buildUnAuthScreen() : buildAuthScreen(context);
  }
}
