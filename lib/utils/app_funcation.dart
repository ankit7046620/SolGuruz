import 'dart:io';

import 'package:get/get.dart';
import 'package:getx/utils/app.dart';

class AppFunction {
  static void goToAndReplace(String routeName, {dynamic arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  static Map<String, String> defaultHeaders() {
    Map<String, String> headers = {};
    headers[HeadersKey.contentType] = HeadersKey.applicationJson;
    headers[HeadersKey.appSource] = Platform.isAndroid ? HeadersKey.android : HeadersKey.iOS;
    headers[HeadersKey.appVersion] = "30009";
    return headers;
  }
}
