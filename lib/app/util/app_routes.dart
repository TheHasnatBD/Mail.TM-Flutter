/*
 * app_routes, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Tuesday, 10/26/2021 at 12:10 AM
 */
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mailtm/modules/auth/login/view/login_page.dart';
import 'package:mailtm/modules/auth/register/view/register_page.dart';
import 'package:mailtm/modules/domains/view/domain_page.dart';
import 'package:mailtm/modules/message/view/message_page.dart';

class AppRoutes {
  static const String HOME = '/'; // domain list
  static const String CHECK_MESSAGE = '/check-message';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';

  static var pageList = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => DomainPage(),
    ),

    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),

    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
    ),

    GetPage(
      name: AppRoutes.CHECK_MESSAGE,
      page: () => MessagePage(),
    ),
  ];
}
