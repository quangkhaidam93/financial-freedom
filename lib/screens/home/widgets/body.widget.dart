import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:financial_freedom/screens/home/expense_categories.controller.dart';
import 'package:financial_freedom/widgets/category_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int segmentedControlGroupValue = 0;
  final ExpenseCategoriesController expenseCategoriesController = Get.find();

  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Expense"),
    1: Text("Income")
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff6f7ff),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: CustomSlidingSegmentedControl<int>(
              initialValue: segmentedControlGroupValue,
              innerPadding: const EdgeInsets.all(8),
              fixedWidth: (MediaQuery.of(context).size.width - 64) / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xfff2f1f8)),
              thumbDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              children: myTabs,
              onValueChanged: (i) {
                var index = i;
                setState(() {
                  segmentedControlGroupValue = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 250,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                    children: expenseCategoriesController.expenseCategoryList
                        .map((c) => CategoryCard(category: c))
                        .toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
