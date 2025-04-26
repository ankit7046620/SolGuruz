import 'package:getx/common/import/common_getx.dart';


import '../../../../utils/app_funcation.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    _init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void _init() {
    goToHomeScreen();

  }



  void goToHomeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // work  same  as pushReplacement
      AppFunction.goToAndReplace(Routes.HOME);
    });
  }
}
