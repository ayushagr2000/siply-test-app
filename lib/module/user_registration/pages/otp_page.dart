import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siply/module/user_registration/controller/user_registration_controller.dart';
import 'package:siply/module/user_registration/widgets/phone_page_heading.dart';
import 'package:siply/utils/app_strings.dart';

class OtpPage extends GetView<UserRegistrationController> {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const PhonePageHeading(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                      AppStrings.pleaseEnterOtp +
                          '\n' +
                          controller.phoneController.text.toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
