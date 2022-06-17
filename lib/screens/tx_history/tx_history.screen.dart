import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_freedom/models/expense_tx.model.dart';
import 'package:financial_freedom/screens/tx_history/tx_history_manager.dart';
import 'package:financial_freedom/utils/money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:financial_freedom/models/tx_history.model.dart'
    as TxHistoryModel;
import 'package:financial_freedom/screens/tx_history/widgets/transaction.widget.dart';
import 'package:intl/intl.dart';

class TxHistoryScreen extends StatefulWidget {
  const TxHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TxHistoryScreen> createState() => _TxHistoryScreenState();
}

class _TxHistoryScreenState extends State<TxHistoryScreen> {
  TxHistoryManager txHistoryManager = TxHistoryManager();

  @override
  void initState() {
    super.initState();

    txHistoryManager.reset();

    FirebaseFirestore.instance
        .collection('transactions')
        .orderBy('updatedAt', descending: true)
        .limit(20)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        final txInJsonFormat = doc.data();
        if (txInJsonFormat != null) {
          final tx = ExpenseTx.fromJson(Map<String, dynamic>.from(
              txInJsonFormat as Map<String, dynamic>));

          if (txHistoryManager.shouldAddNewDate(tx)) {
            txHistoryManager
                .addNewDate(TxHistoryModel.TxHistory(tx.updatedAt!, [tx]));
          } else {
            txHistoryManager.addNewHistory(tx);
          }
          setState(() {});
        }
      }
    });
  }

  Widget transactionsBuilder(TxHistoryModel.TxHistory txHistory) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MM/yyyy').format(txHistory.date),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...txHistory.transactions
              .map((tx) => TransactionWidget(
                  note: tx.note!,
                  amount: MoneyFormatter.transformMoneyToVNCurrency(tx.amount!),
                  time: DateFormat.Hm().format(tx.updatedAt!)))
              .toList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          itemBuilder: (_, idx) {
            return transactionsBuilder(txHistoryManager.txHistories[idx]);
          },
          itemCount: txHistoryManager.txHistories.length),
    );
  }
}
