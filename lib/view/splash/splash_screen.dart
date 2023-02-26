import 'package:flutter/material.dart';
import 'package:social_media/res/fonts.dart';
import 'package:social_media/view-model/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashServices.navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('assets/images/logo.jpg'),
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Firebase Socail Media App',
                style: TextStyle(
                    fontFamily: AppFonts.sfProDisplayBold,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      )),
    );
  }
}
