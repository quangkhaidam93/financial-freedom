import 'dart:ui';

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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void updateMoney(String newMoney) {
    setState(() {
      money = newMoney;
    });
    widget.formFieldState.didChange(newMoney);
  }

  void increaseMoney() {
    int current;
    if (_controller.text == '') {
      current = 0;
    } else {
      current = int.parse(_controller.text);
    }
    updateMoney((current + 1).toString());
    _controller.text = (current + 1).toString();
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
  }

  void decreaseMoney() {
    int current;
    if (_controller.text == '') {
      current = 0;
    } else {
      current = int.parse(_controller.text);
    }
    if (current == 0) return;
    updateMoney((current - 1).toString());
    _controller.text = (current - 1).toString();
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
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
            onTap: () => decreaseMoney(),
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
                )
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
              onTap: () => increaseMoney())
        ],
      ),
    );
  }
}
