import 'package:financial_freedom/models/expense_tx.model.dart';
import 'package:get/get.dart';

class ExpenseTxsController extends GetxController {
  final RxList<ExpenseTx> expenseTxList = (<ExpenseTx>[]).obs;

  void addTxToList(ExpenseTx newTx) {
    expenseTxList.add(newTx);
  }
}
