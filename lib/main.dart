import 'package:bottom_navigation/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_navigation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
              builder: (BuildContext context2, Orientation orientation) {
                SizeConfig.init(constraints, orientation);
                return GetMaterialApp(
                  title: "Gurupath Partner",
                  useInheritedMediaQuery: true,
                  builder: DevicePreview.appBuilder,
                  debugShowCheckedModeBanner: false,
                  defaultTransition:
                  GetPlatform.isIOS ? Transition.cupertino : Transition.rightToLeft,
                  home:  const BottomNavigation(selectedIndex: 0,),
                );
              });
        });
  }
}
