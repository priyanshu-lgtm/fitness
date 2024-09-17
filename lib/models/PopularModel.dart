import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Popularmodel {
  String iconPath;
  String itemName;
  String quality;
  Color boxColor;
  bool isViewSelected;

  Popularmodel(
      {required this.iconPath,
        required this.itemName,
        required this.quality,
        required this.boxColor,
        required this.isViewSelected});

  static List<Popularmodel> getRecommendation() {
    List<Popularmodel> dietPlan = [];

    dietPlan.add(Popularmodel(
        itemName: 'Honey Pancake',
        iconPath: 'assets/honey-pancakes.svg',
        boxColor: Color(0xff9DCEFF),
        quality: "Easy|30mins|180kcal",
        isViewSelected: true));
    dietPlan.add(Popularmodel(
        itemName: 'Canai Bread',
        iconPath: 'assets/canai-bread.svg',
        boxColor: Color(0xffEEA4CE),
        quality: "Easy|20mins|220kcal",
        isViewSelected: false));
    dietPlan.add(Popularmodel(
        itemName: 'Pie',
        iconPath: 'assets/pie.svg',
        boxColor: Color(0xff9DCEFF),
        quality: "crunchy",
        isViewSelected: false));
    dietPlan.add(Popularmodel(
        itemName: 'Smoothies',
        iconPath: 'assets/orange-snacks.svg',
        boxColor: Color(0xffEEA4CE),
        quality: "green",
        isViewSelected: false));
    return dietPlan;
  }
}
