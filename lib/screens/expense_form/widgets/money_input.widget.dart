import 'package:financial_freedom/utils/money_formatter.dart';
import 'package:flutter/material.dart';

class MoneyInputFormField extends FormField<String> {
  MoneyInputFormField({
    Key? key,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? initialValue,
    AutovalidateMode? autovalidateMode,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (state) {
              return MoneyInput(
                formFieldState: state,
              );
            });
}

class MoneyInput extends StatefulWidget {
  final FormFieldState<String> formFieldState;

  const MoneyInput({Key? key, required this.formFieldState}) : super(key: key);

  @override
  State<MoneyInput> createState() => _MoneyInputState();
}

class _MoneyInputState extends State<MoneyInput> {
  late TextEditingController _controller;
  String money = '';
  String moneyForDisplay = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void updateMoney(String newMoney) {
    newMoney = MoneyFormatter.transformMoneyToNormalString(newMoney);
    setState(() {
      money = newMoney;
      if (newMoney != '') {
        moneyForDisplay = MoneyFormatter.transformMoneyToVNCurrency(newMoney);
      } else {
        moneyForDisplay = '0';
      }
    });
    var offset = moneyForDisplay.length > 1 ? moneyForDisplay.length - 1 : 1;
    _controller.value = TextEditingValue(
      text: moneyForDisplay,
      selection: TextSelection.collapsed(offset: offset),
    );
    widget.formFieldState.didChange(money);
  }

  void changeMoney(bool increase) {
    int current;
    if (_controller.text == '') {
      current = 0;
    } else {
      current = int.parse(
          MoneyFormatter.transformMoneyToNormalString(_controller.text));
    }

    if (increase) {
      current += 1;
    } else {
      if (current == 0) return; // EXPLAIN: Money cannot be negative
      current -= 1;
    }
    updateMoney(current.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Icon(
              Icons.remove,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
              shadows: [
                Shadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            onTap: () => changeMoney(false),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 30),
                  decoration: const InputDecoration(
                    hintText: '0',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => updateMoney(value),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('VNĐ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                widget.formFieldState.hasError
                    ? FittedBox(
                        child: Text(widget.formFieldState.errorText!,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error)),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          GestureDetector(
              child: Icon(
                Icons.add,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
                shadows: [
                  Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              onTap: () => changeMoney(true))
        ],
      ),
    );
  }
}
