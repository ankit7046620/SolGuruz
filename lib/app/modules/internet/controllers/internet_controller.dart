import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _listenToConnectionChanges();
  }

  void _checkInitialConnection() async {
    final results = await Connectivity().checkConnectivity();
    isConnected.value = results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi);
  }

  void _listenToConnectionChanges() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      bool status = results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi);

      if (!status && isConnected.value) {
        Get.snackbar(
          "Offline",
          "No internet connection",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
      }

      isConnected.value = status;
    });
  }
}