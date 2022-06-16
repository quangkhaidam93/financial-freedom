import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_freedom/models/expense_category.model.dart';
import 'package:financial_freedom/utils/transformValueToEnum.dart';
import 'package:financial_freedom/utils/transfromEnumToValue.dart';

class ExpenseTx {
  ExpenseCategoryType? type;
  String? amount;
  String? note;

  ExpenseTx({this.type, this.amount, this.note});

  factory ExpenseTx.fromJson(Map<String, dynamic> json) {
    final type = transformStringToExpanseCategoryType(json['type']!);
    return ExpenseTx(amount: json['amount'], type: type, note: json['note']);
  }

  // factory ExpenseTx.fromObject(Object object) {
  //   final type = transformStringToExpanseCategoryType(object.type);
  //   return ExpenseTx(amount: json['amount'], type: type, note: json['note']);
  // }

  transformToJson() {
    return {
      'type': transformFromExpenseCategoryTypeToString(type!),
      'amount': amount,
      'note': note ?? ''
    };
  }

  Future<void> saveExpenseTx() async {
    final transactionCollection =
        FirebaseFirestore.instance.collection('transactions');
    await transactionCollection.add(transformToJson());
  }
}
