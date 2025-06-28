import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_login_form/routes/routes.dart';
import 'constant/app_theme.dart';
import 'controller_binder.dart';
void main() => runApp(DevicePreview(
  enabled: true,
  builder: (context) => AuthApp(),
),);
class AuthApp extends StatelessWidget {
  const AuthApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: Routes.auth,
      getPages: Routes.pages,
      initialBinding: ControllerBinder(),
    );
  }
}