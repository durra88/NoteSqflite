import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxService {
  var isArabic = false.obs;

  void changeLanguage(var p1, var p2) async {
    var locale = Locale(p1, p2);
    await Get.updateLocale(locale);

    if (p1 == 'ar' && p2 == 'AR') {
      isArabic.value == true;
    } else {
      isArabic.value == false;
    }
  }
}
