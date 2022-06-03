import 'package:flutter/material.dart';

class ExpenseCategory {
  final String icon;
  final String name;
  final Color lightColor;
  final Color darkColor;
  final double total;
  final double spent;
  late double ratio;

  ExpenseCategory(
      {required this.icon,
      required this.name,
      required this.lightColor,
      required this.darkColor,
      required this.total,
      required this.spent}) {
    ratio = spent / total;
  }
}

enum ExpenseCategoryType {
  food,
  fashion,
  transportation,
  investment,
  accessories,
  entertainment,
  service,
  healthcare,
  housing,
  family,
  debtAndInterest
}
