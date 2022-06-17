import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_freedom/models/expense_category.model.dart';
import 'package:financial_freedom/utils/transformValueToEnum.dart';
import 'package:financial_freedom/utils/transformEnumToValue.dart';

class ExpenseTx {
  ExpenseCategoryType? type;
  String? amount;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;

  ExpenseTx(
      {this.type, this.amount, this.note, this.createdAt, this.updatedAt});

  factory ExpenseTx.fromJson(Map<String, dynamic> json) {
    final type = transformStringToExpanseCategoryType(json['type']!);

    return ExpenseTx(
        amount: json['amount'],
        type: type,
        note: json['note'],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate());
  }

  // factory ExpenseTx.fromObject(Object object) {
  //   final type = transformStringToExpanseCategoryType(object.type);
  //   return ExpenseTx(amount: json['amount'], type: type, note: json['note']);
  // }

  transformToJson() {
    return {
      'type': transformFromExpenseCategoryTypeToString(type!),
      'amount': amount,
      'note': note ?? '',
      'createdAt': DateTime.now().toUtc(),
      'updatedAt': DateTime.now().toUtc(),
    };
  }

  Future<void> saveExpenseTx() async {
    final transactionCollection =
        FirebaseFirestore.instance.collection('transactions');
    await transactionCollection.add(transformToJson());
  }
}
