import 'package:get/get.dart';
import 'package:social_media/utils/routes/route_name.dart';
import 'package:social_media/view/home/home.dart';
import 'package:social_media/view/splash/splash_screen.dart';

class GetRoutes {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: RouteName.splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: RouteName.homeScreen,
        page: () => Home(),
      ),
    ];
  }
}
