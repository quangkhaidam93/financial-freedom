import 'package:financial_freedom/models/expense_category.model.dart';

ExpenseCategoryType transformToExpanseCategoryType(int value) {
  switch (value) {
    case 0:
      return ExpenseCategoryType.food;
    case 1:
      return ExpenseCategoryType.fashion;
    case 2:
      return ExpenseCategoryType.transportation;
    case 3:
      return ExpenseCategoryType.investment;
    case 4:
      return ExpenseCategoryType.accessories;
    case 5:
      return ExpenseCategoryType.entertainment;
    case 6:
      return ExpenseCategoryType.service;
    case 7:
      return ExpenseCategoryType.healthcare;
    case 8:
      return ExpenseCategoryType.housing;
    case 9:
      return ExpenseCategoryType.family;
    case 10:
      return ExpenseCategoryType.debtAndInterest;
    default:
      return ExpenseCategoryType.food;
  }
}
