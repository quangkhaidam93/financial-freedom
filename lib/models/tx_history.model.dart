import 'package:financial_freedom/models/expense_tx.model.dart';

class TxHistory {
  DateTime date;
  List<ExpenseTx> transactions;

  TxHistory(this.date, this.transactions);

  void addTransaction(ExpenseTx tx) {
    transactions.add(tx);
  }
}
