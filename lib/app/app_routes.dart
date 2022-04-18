import 'package:get/get.dart';
import 'package:siply/module/user_registration/pages/otp_page.dart';
import 'package:siply/module/user_registration/pages/phone_page.dart';

class AppRoutes {
  static Future? go(String routeName, {dynamic arguments}) {
    return Get.toNamed(routeName, arguments: arguments);
  }

  static Future? goAndPopAll(String routeName, {dynamic arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  static Future? pop() {
    Get.back();
  }
}

class AppRouteName {
  static const String otpPage = '/otp';
  static const String phone = '/phone';

  static final routes = [
    GetPage(name: otpPage, page: () => const OtpPage()),
    GetPage(name: phone, page: () => const PhonePage()),
  ];
}
