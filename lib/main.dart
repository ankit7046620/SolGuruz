import 'package:flutter/material.dart';
import 'package:getx/app/modules/internet/controllers/internet_controller.dart';
import 'package:getx/common/import/common_getx.dart';
import 'package:getx/common/import/common_import.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';

import 'app/modules/internet/bindings/internet_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  TGFlavor.init("assets/config/flavors.json");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQueryData.fromView(WidgetsBinding.instance.window).size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: InternetBinding(),
          builder: EasyLoading.init(),
          theme: ThemeData(useMaterial3: false, primaryColor: Colors.white),
          title: "GETX DEMO",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
