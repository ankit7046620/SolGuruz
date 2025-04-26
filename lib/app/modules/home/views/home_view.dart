import 'package:flutter/material.dart';

import 'package:getx/app/modules/home/controllers/home_controller.dart';

import 'package:getx/common/import/common_getx.dart';
import 'package:getx/common/import/common_import.dart';

import 'package:getx/vo/news_response_vo.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(LabelConstants.screenHome),
        centerTitle: true,
      ),
      body:



      GetBuilder<HomeController>(
        builder: (_) {
          return controller.paginatedList.isNotEmpty && controller.isDataSet == true?
            
            ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.paginatedList.length,
            // replace with your actual list
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(
                  controller.paginatedList[index].urlToImage ??
                      'https://picsum.photos/200',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(controller.paginatedList[index].title),
                subtitle: Text(controller.paginatedList[index].author ?? ''),
                onTap: () {
                  // Handle tap if needed
                },
              );
            },
          )
          
          :  Center(child:  controller.isDataSet ? Text("No data",):SizedBox());
        },
      ),
    );
  }


}
