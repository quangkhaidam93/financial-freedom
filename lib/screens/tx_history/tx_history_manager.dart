import 'package:financial_freedom/models/expense_tx.model.dart';
import 'package:financial_freedom/models/tx_history.model.dart';

class TxHistoryManager {
  List<TxHistory> txHistories = [];

  void addNewDate(TxHistory txHistory) {
    txHistories.add(txHistory);
  }

  void addNewHistory(ExpenseTx tx) {
    txHistories[txHistories.length - 1].addTransaction(tx);
  }

  void reset() {
    txHistories.clear();
  }

  TxHistory get latestHistory => txHistories[txHistories.length - 1];

  bool shouldAddNewDate(ExpenseTx tx) {
    if (txHistories.isEmpty) return true;
    final latestHistoryDate = latestHistory.date;
    return tx.updatedAt!.difference(latestHistoryDate).inDays != 0;
  }
}
