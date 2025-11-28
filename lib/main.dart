import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/route_page.dart';

void main() {
SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]
);
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      title: 'Kappi Shop',
      debugShowCheckedModeBanner: false,
       getPages: AppRoutes.appRoutes(),
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: Appnames.onboradingScreen,
    );
  }
}


