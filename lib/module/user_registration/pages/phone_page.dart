import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siply/module/user_registration/controller/user_registration_controller.dart';
import 'package:siply/module/user_registration/widgets/phone_page_heading.dart';
import 'package:siply/module/user_registration/widgets/phone_text_field_widget.dart';
import 'package:siply/module/user_registration/widgets/swiping_button.dart';
import 'package:siply/utils/app_strings.dart';

class PhonePage extends GetView<UserRegistrationController> {
  const PhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UserRegistrationController>(
            init: UserRegistrationController(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: const [
                        PhonePageHeading(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(AppStrings.phoneTitle),
                        ),
                        PhoneTextField()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: controller.onPhoneScreen,
                        child: SwipingButton(
                          isActive: controller.isSwipeButtonActive,
                          text: AppStrings.swipeToSubmit,
                          activeColor: controller.isSwipeButtonActive
                              ? Colors.green
                              : Colors.grey,
                          backgroundText: AppStrings.getStarted,
                          onSwipeCallback: () {
                            controller.login(context);
                          },
                        ),
                      ),
                      Visibility(
                          visible: !controller.onPhoneScreen,
                          child: const CircularProgressIndicator())
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
