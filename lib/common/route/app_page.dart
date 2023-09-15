import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/home_dashboard/screen/bottom_navigation.dart';
import 'package:cmms/feature/home_dashboard/screen/home.dart';
import 'package:cmms/feature/login_signup/screen/login.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.home,
        page: () => const BottomNavigation(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.login,
        page: () => const Login(),
        transition: Transition.fadeIn),
  ];
}
