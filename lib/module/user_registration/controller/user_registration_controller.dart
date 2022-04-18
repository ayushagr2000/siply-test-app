import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siply/app/app_routes.dart';

class UserRegistrationController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  bool onPhoneScreen = true;
  bool isSwipeButtonActive = false;

  void login() {
    onPhoneScreen = false;
    update();
    Future.delayed(const Duration(seconds: 2), () {
      AppRoutes.go(AppRouteName.otpPage);
      onPhoneScreen = true;
    });
  }

  void setSwipeButtonState(bool status) {
    isSwipeButtonActive = status;
    update();
  }
}
