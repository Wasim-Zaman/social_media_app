import 'dart:async';

import 'package:get/get.dart';
import 'package:social_media/utils/routes/route_name.dart';

class SplashServices {
  static void navigateToHome() async {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Get.toNamed(RouteName.homeScreen);
    });
  }
}
