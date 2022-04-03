import 'package:flutter/cupertino.dart';

class Category{

  String name;
  Color clr;
  Widget icon;
  Category(String categoryName, Color color, Widget categoryIcon) : name = categoryName, clr = color, icon = categoryIcon;
}