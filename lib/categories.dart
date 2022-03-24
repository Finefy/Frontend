import 'package:flutter/cupertino.dart';

class Category{

  String name;
  Color clr;
  Icon icon;
  Category(String categoryName, Color color, Icon categoryIcon) : name = categoryName, clr = color, icon = categoryIcon;
}