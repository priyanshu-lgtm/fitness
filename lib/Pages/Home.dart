import 'package:fitness/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/PopularModel.dart';
import '../models/RecommendationModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<RecommendationModel> diet = [];
  List<Popularmodel> popular = [];

  void _getCategory() {
    categories = CategoryModel.getCategories();
  }

  void _getDietPlan() {
    diet = RecommendationModel.getRecommendation();
  }

  void _getPopular(){
    popular = Popularmodel.getRecommendation();
  }

  @override
  Widget build(BuildContext context) {
    _getCategory();
    _getDietPlan();
    _getPopular();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          searchField(),

          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
              ],
            ),
          ),

          getCategoriesView(),

          const Padding(
            padding: EdgeInsets.only(left: 24, top: 24),
            child: Text("Recommendation \n for Diet",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25)),
          ),

          getReccomendation(),

          const Padding(
            padding: EdgeInsets.only(left: 24, top: 24),
            child: Text("Popular",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25)),
          ),
          getPopular(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Column getPopular(){
    return Column(
        children: [ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: popular.length,
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 115,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff000000).withOpacity(.21),
                          blurRadius: 40,
                          spreadRadius: 0.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(popular[index].iconPath,width: 60,height: 60),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(popular[index].itemName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 18)),
                        Text(popular[index].quality,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 18)),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )]);
  }

  Container getReccomendation() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      height: 250,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 25,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: diet.length,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              decoration: BoxDecoration(
                  color: diet[index].boxColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(diet[index].iconPath, width: 80, height: 80),
                  Column(
                    children: [
                      Text(diet[index].itemName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      Text(diet[index].quality,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              fontSize: 13)),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          diet[index].isViewSelected
                              ? Color(0xff9DCEFF)
                              : Colors.transparent,
                          diet[index].isViewSelected
                              ? Color(0xff92A3FD)
                              : Colors.transparent
                        ]),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("View",
                        style: TextStyle(
                            color: diet[index].isViewSelected
                                ? Colors.white
                                : Color(0xffCF8BF2).withOpacity(.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  )
                ],
              ),
            );
          }),
    );
  }

  Container getCategoriesView() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      height: 140,
      child: ListView.separated(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
                width: 25,
              ),
          itemBuilder: (context, index) {
            return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset(categories[index].iconPath),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(categories[index].name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ));
          }),
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
        left: 36,
        right: 36,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xff000000).withOpacity(.21),
              blurRadius: 40,
              spreadRadius: 0.0)
        ],
      ),
      child: TextField(
        maxLines: 1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: "Search Panipuri",
            hintStyle: TextStyle(
                color: Color(0xffDDDADA), fontStyle: FontStyle.italic),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Container(
              width: 50,
              margin: EdgeInsets.only(right: 10),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: VerticalDivider(
                        indent: 10,
                        endIndent: 10,
                        width: 1,
                        color: Color(0xffDDDADA),
                      ),
                    ),
                    Icon(Icons.filter_alt_outlined)
                  ],
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Breakfast"),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Colors.black),
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              // color: Colors.transparent,
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset("assets/icon_back.svg"),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.menu),
            ))
      ],
    );
  }
}
