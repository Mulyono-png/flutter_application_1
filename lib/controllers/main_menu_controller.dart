import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../menu/home_page.dart';
import '../menu/profile_page.dart';
import '../menu/history_page.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> listPages = const [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];
}
