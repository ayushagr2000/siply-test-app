import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siply/module/user_registration/controller/user_registration_controller.dart';
import 'package:siply/utils/app_strings.dart';

class PhoneTextField extends GetView<UserRegistrationController> {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: TextField(
          controller: controller.phoneController,
          onChanged: (value) {
            if (value.length >= 10) {
              controller.setSwipeButtonState(true);
            } else {
              controller.setSwipeButtonState(false);
            }
          },
          maxLength: 10,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: AppStrings.phone,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
