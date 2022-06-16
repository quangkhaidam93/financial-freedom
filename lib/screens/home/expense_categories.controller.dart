import 'package:financial_freedom/models/expense_category.model.dart';
import 'package:get/get.dart';

class ExpenseCategoriesController extends GetxController {
  final Map<String, int> _posInCategoryList = {};

  final RxList<ExpenseCategory> expenseCategoryList = (<ExpenseCategory>[]).obs;
  var total = 0.0.obs;

  void reset() {
    _posInCategoryList.clear();
    expenseCategoryList.clear();
  }

  void addNewPosition(String key, int pos) {
    _posInCategoryList[key] = pos;
  }

  void saveCategoryToList(String categoryName, String amount) {
    var posInList = _posInCategoryList[categoryName];
    if (posInList == null) {
      addNewPosition(categoryName, expenseCategoryList.length);
      final newCategory = ExpenseCategory(
          icon: ExpenseCategory.getIconFromName(categoryName),
          name: categoryName,
          lightColor: ExpenseCategory.getLightColorFromName(categoryName),
          darkColor: ExpenseCategory.getDarkColorFromName(categoryName),
          spent: double.parse(amount));
      expenseCategoryList.add(newCategory);
    } else {
      expenseCategoryList[posInList].updateSpent(double.parse(amount));
    }
  }

  void updateTotalForAllCategories(double total) {
    for (var cat in expenseCategoryList) {
      cat.updateTotal(total);
    }
    this.total.value = total;
  }
}
