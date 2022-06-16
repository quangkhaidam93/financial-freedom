import 'package:financial_freedom/screens/expense_form/expense_form.screen.dart';
import 'package:financial_freedom/screens/home/expense_categories.controller.dart';
import 'package:financial_freedom/utils/money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);
  final ExpenseCategoriesController expenseCategoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 16, right: 16),
      color: Theme.of(context).colorScheme.primary,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(children: [
        Text(
          'Home',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            children: [
              Obx(
                () => Text(
                    MoneyFormatter.transformMoneyToVNCurrency(
                        expenseCategoriesController.total.toStringAsFixed(0)),
                    style: Theme.of(context).textTheme.headline1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(16)),
                child: const Text('+8%'),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: () {
              Get.toNamed(ExpenseFormScreen.routeName);
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Expense'),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Colors.red)))),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Expense'),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Colors.green)))),
          ),
        ),
      ]),
    );
  }
}
