import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siply/app/app_routes.dart';
import 'package:siply/module/user_registration/pages/phone_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Siply assignment app',
      getPages: AppRouteName.routes,
      initialRoute: AppRouteName.phone,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
