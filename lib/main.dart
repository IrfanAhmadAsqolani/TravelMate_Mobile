import 'package:flutter/material.dart';
import 'package:travelmate/features/login/pages/login_page.dart';
import 'package:travelmate/utils/utils.dart';

import 'dependencies/dependencies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'SFPro',
          ),
          getPages: Routes.pages(),
          initialRoute: loginPageRoute,
        );
      },
    );
  }
}
