import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx/app/modules/internet/controllers/internet_controller.dart';
import 'package:getx/common/import/common_getx.dart';
import 'package:getx/common/import/common_import.dart';
import 'package:getx/constant/app_const.dart';
import 'package:getx/vo/artical_vo.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final internet = Get.find<InternetController>();

  //TODO: Implement HomeController
  final scrollController = ScrollController();

  final count = 0.obs;
  List<Article> articlesList = [];
  List<Article> paginatedList = [];
  bool isDataSet = false;
  int totalData = 0;

  @override
  void onInit() {
    super.onInit();
    fetchNews();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoredata();
      }
    });
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

  Future<void> fetchNews() async {
    if (!internet.isConnected.value) {
      EasyLoading.showError("No Internet Connection");
      return;
    }
    final Uri uri = Uri.parse(ApiUri.baseurl).replace(
      queryParameters: {
        'q': "apple",
        'from': "2025-04-25",
        'to': "2025-04-25",
        'sortBy': "popularity",
        'apiKey': AppConstant.newsAppApikey,
      },
    );

    try {
      EasyLoading.show();
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final List articlesJson = data['articles'];
        totalData = data['totalResults'];
        articlesList =
            articlesJson.map((json) => Article.fromJson(json)).toList();
        paginatedList = articlesList.take(10).toList();
        isDataSet = true;
        EasyLoading.dismiss();
        update();
      } else {
        print('Error: ${response.statusCode}');
        EasyLoading.dismiss();
        ;
        isDataSet = true;
        update();
      }
    } catch (e) {
      isDataSet = true;
      update();
      EasyLoading.dismiss();
      print('Exception: $e');
    }
  }

  _loadMoredata() {
    if (paginatedList.length != totalData) {
      paginatedList.addAll(
        articlesList.skip(paginatedList.length).take(10).toList(),
      );
      update();
    }
  }
}
