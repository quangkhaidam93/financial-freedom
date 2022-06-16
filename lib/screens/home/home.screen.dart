import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_freedom/models/expense_tx.model.dart';
import 'package:financial_freedom/screens/home/expense_categories.controller.dart';
import 'package:financial_freedom/screens/home/expense_txs.controller.dart';
import 'package:financial_freedom/screens/home/widgets/body.widget.dart';
import 'package:financial_freedom/screens/home/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final expenseTxsController = Get.put(ExpenseTxsController());
  final expenseCategoriesController = Get.put(ExpenseCategoriesController());

  @override
  void initState() {
    super.initState();

    expenseCategoriesController.reset();

    FirebaseFirestore.instance
        .collection('transactions')
        .get()
        .then((QuerySnapshot querySnapshot) {
      double totalSpent = 0;
      for (var doc in querySnapshot.docs) {
        final txInJsonFormat = doc.data();
        if (txInJsonFormat != null) {
          final tx =
              Map<String, dynamic>.from(txInJsonFormat as Map<String, dynamic>);

          expenseTxsController.addTxToList(ExpenseTx.fromJson(tx));
          final String amount = tx['amount']!;
          final String name = tx['type']!;
          expenseCategoriesController.saveCategoryToList(name, amount);
          totalSpent += double.parse(amount);
        }
      }
      expenseCategoriesController.updateTotalForAllCategories(totalSpent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [HomeHeader(), const HomeBody()],
        ),
      ),
    );
  }
}
