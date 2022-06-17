import 'package:flutter/material.dart';
import 'package:travelmate/utils/utils.dart';

import 'authentication/authentication.dart';
import 'dependencies/dependencies.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: widget!,
            );
          },
          theme: ThemeData(
            fontFamily: 'SFPro',
          ),
          getPages: Routes.pages(),
          // initialRoute: loginPageRoute,
        );
      },
    );
  }
}
