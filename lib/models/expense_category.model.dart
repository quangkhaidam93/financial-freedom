import 'package:financial_freedom/utils/number_transformer.dart';
import 'package:flutter/material.dart';

class ExpenseCategory {
  final String icon;
  final String name;
  final Color lightColor;
  final Color darkColor;
  double total = 0;
  double spent;
  double? ratio;

  ExpenseCategory(
      {required this.icon,
      required this.name,
      required this.lightColor,
      required this.darkColor,
      required this.spent});

  void updateSpent(double amount) {
    spent += amount;
    ratio = spent / total;
  }

  void updateTotal(double total) {
    this.total = total;
    ratio = NumberTransformer.roundingDouble(spent / this.total);
  }

  static String getIconFromName(String name) {
    switch (name) {
      case 'Food':
        return '';
      case 'Fashion':
        return '';
      case 'Transportation':
        return '';
      case 'Investment':
        return '';
      case 'Accessories':
        return '';
      case 'Entertainment':
        return '';
      case 'Service':
        return '';
      case 'Healthcare':
        return '';
      case 'Housing':
        return '';
      case 'Family':
        return '';
      case 'Debt and interest':
        return '';
      default:
        return '';
    }
  }

  static Color getLightColorFromName(String name) {
    switch (name) {
      case 'Food':
        return const Color(0xffB5FED9);
      case 'Fashion':
        return const Color(0xffc6e6ff);
      case 'Transportation':
        return const Color(0xffA9A8AE);
      case 'Investment':
        return const Color(0xffFFEFD3);
      case 'Accessories':
        return const Color(0xffFFF794);
      case 'Entertainment':
        return const Color(0xffD4F2D2);
      case 'Service':
        return const Color(0xff76E5FC);
      case 'Healthcare':
        return const Color(0xff9DACFF);
      case 'Housing':
        return const Color(0xffD1F0B1);
      case 'Family':
        return const Color(0xffE0D3DE);
      case 'Debt and interest':
        return const Color(0xffFFA69E);
      default:
        return const Color(0xffB5FED9);
    }
  }

  static Color getDarkColorFromName(String name) {
    switch (name) {
      case 'Food':
        return const Color(0xff98CBB4);
      case 'Fashion':
        return const Color(0xff85ccf5);
      case 'Transportation':
        return const Color(0xffA09FA6);
      case 'Investment':
        return const Color(0xffFFC49B);
      case 'Accessories':
        return const Color(0xffFFF689);
      case 'Entertainment':
        return const Color(0xffADBDAB);
      case 'Service':
        return const Color(0xff4BC0D9);
      case 'Healthcare':
        return const Color(0xff6457A6);
      case 'Housing':
        return const Color(0xffB6CB9E);
      case 'Family':
        return const Color(0xffD6C6C4);
      case 'Debt and interest':
        return const Color(0xffFF7E6B);
      default:
        return const Color(0xff98CBB4);
    }
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
