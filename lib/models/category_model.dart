import 'dart:ui';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(
            name: 'Salad',
            iconPath: 'assets/plate.svg',
            boxColor: Color(0xff9DCEFF)
        )
    );

    categories.add(
        CategoryModel(
            name: 'Cake',
            iconPath: 'assets/pancakes.svg',
            boxColor: Color(0xffEEA4CE)
        )
    );

    categories.add(
        CategoryModel(
            name: 'Pie',
            iconPath: 'assets/pie.svg',
            boxColor: Color(0xff9DCEFF)
        )
    );

    categories.add(
        CategoryModel(
            name: 'Smoothies',
            iconPath: 'assets/orange-snacks.svg',
            boxColor: Color(0xffEEA4CE)
        )
    );


    return categories;
  }
}