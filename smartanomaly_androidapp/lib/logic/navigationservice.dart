import 'package:flutter/material.dart';

class NavigationService {
  var currentPageIndex = ValueNotifier<int>(0);
  final isLoadingNotifier = ValueNotifier<bool>(false);
  final brightness = ValueNotifier<Brightness>(Brightness.dark);
  
  get locator => null;

  void setCurrentPageIndex(int index){
    currentPageIndex.value = index;
  }


   void setBrightness(bool isDark) {
    if (isDark) {
      brightness.value = Brightness.dark;
    } else {
      brightness.value = Brightness.light;
    }
  }
}