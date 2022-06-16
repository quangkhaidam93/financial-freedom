import 'package:financial_freedom/models/expense_tx.model.dart';
import 'package:financial_freedom/screens/expense_form/widgets/category_picker.widget.dart';
import 'package:financial_freedom/screens/expense_form/widgets/money_input.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseFormScreen extends StatelessWidget {
  static const routeName = '/expense-form';
  final _formKey = GlobalKey<FormState>();
  final _data = ExpenseTx();

  ExpenseFormScreen({Key? key}) : super(key: key);

  void showDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        builder: (_) => SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: CupertinoDatePicker(
                  onDateTimeChanged: (_) {},
                  mode: CupertinoDatePickerMode.date),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Transaction')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CategoryPickerFormField(
                  onSaved: (value) => _data.type = value!,
                  validator: (value) {
                    if (value == null) {
                      return 'Please give it a category';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: MoneyInputFormField(
                    onSaved: (value) => _data.amount = value!,
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please give some money';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    onSaved: (value) => _data.note = value,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Some note about this transaction... ^^',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          gapPadding: 16,
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: const Color(0xfff4f0fa),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            await _data.saveExpenseTx();

            Get.back();
          }
        },
        child: const Text('Confirm'),
      ),
    );
  }
}
