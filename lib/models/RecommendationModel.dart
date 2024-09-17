import 'dart:ui';

import 'package:flutter/cupertino.dart';

class RecommendationModel {
  String iconPath;
  String itemName;
  String quality;
  Color boxColor;
  bool isViewSelected;

  RecommendationModel(
      {required this.iconPath,
      required this.itemName,
      required this.quality,
      required this.boxColor,
      required this.isViewSelected});

  static List<RecommendationModel> getRecommendation() {
    List<RecommendationModel> dietPlan = [];

    dietPlan.add(RecommendationModel(
        itemName: 'Honey Pancake',
        iconPath: 'assets/honey-pancakes.svg',
        boxColor: Color(0xff9DCEFF),
        quality: "Easy|30mins|180kcal",
        isViewSelected: true));
    dietPlan.add(RecommendationModel(
        itemName: 'Canai Bread',
        iconPath: 'assets/canai-bread.svg',
        boxColor: Color(0xffEEA4CE),
        quality: "Easy|20mins|220kcal",
        isViewSelected: false));
    dietPlan.add(RecommendationModel(
        itemName: 'Pie',
        iconPath: 'assets/pie.svg',
        boxColor: Color(0xff9DCEFF),
        quality: "crunchy",
        isViewSelected: false));
    dietPlan.add(RecommendationModel(
        itemName: 'Smoothies',
        iconPath: 'assets/orange-snacks.svg',
        boxColor: Color(0xffEEA4CE),
        quality: "green",
        isViewSelected: false));
    return dietPlan;
  }
}
