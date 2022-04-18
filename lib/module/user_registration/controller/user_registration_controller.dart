import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siply/module/user_registration/pages/otp_page.dart';

class UserRegistrationController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  bool onPhoneScreen = true;
  bool isSwipeButtonActive = false;

  void login(BuildContext context) {
    onPhoneScreen = false;
    update();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const OtpPage()));
      onPhoneScreen = true;
    });
  }

  void setSwipeButtonState(bool status) {
    isSwipeButtonActive = status;
    update();
  }
}
