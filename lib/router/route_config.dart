import 'package:dog_app/ui/pages/home/home_page.dart';
import 'package:dog_app/ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String home = "/home";
  static const String detailBreed = "/detail/:breed";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: home, page: () => const HomePageChill()),
    GetPage(name: detailBreed, page: () => const HomePageChill()),
  ];
}
