
import 'package:get/get.dart';
import '../screen/auth/views/auth_screen.dart';
import '../screen/auth/views/signin_screen.dart';
import '../screen/auth/views/signup_screen.dart';
import '../screen/home/views/product_list_screen.dart';

class Routes {
  static const String auth = '/auth';
  static const String product = '/product';
  static const String login = '/login';
  static const String signup = '/signup';
  static final List<GetPage> pages = [
    GetPage(
      name: auth,
      page: () => AuthScreen(),
    ),
    GetPage(
      name: product,
      page: () => ProductListScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: login,
      page: () => SignupScreen(),
    ),
  ];
}
