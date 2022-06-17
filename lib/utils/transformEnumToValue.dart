import 'package:financial_freedom/models/expense_category.model.dart';

String transformFromExpenseCategoryTypeToString(ExpenseCategoryType type) {
  switch (type) {
    case ExpenseCategoryType.food:
      return 'Food';
    case ExpenseCategoryType.fashion:
      return 'Fashion';
    case ExpenseCategoryType.transportation:
      return 'Transportation';
    case ExpenseCategoryType.investment:
      return 'Investment';
    case ExpenseCategoryType.accessories:
      return 'Accessories';
    case ExpenseCategoryType.entertainment:
      return 'Entertainment';
    case ExpenseCategoryType.service:
      return 'Service';
    case ExpenseCategoryType.healthcare:
      return 'Healthcare';
    case ExpenseCategoryType.housing:
      return 'Housing';
    case ExpenseCategoryType.family:
      return 'Family';
    case ExpenseCategoryType.debtAndInterest:
      return 'Debt and Interest';
    default:
      return '';
  }
}
