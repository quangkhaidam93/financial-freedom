import 'package:financial_freedom/constants/category.dart';
import 'package:financial_freedom/models/expense_category.model.dart';
import 'package:financial_freedom/utils/transformValueToEnum.dart';
import 'package:financial_freedom/utils/transfromEnumToValue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPickerFormField extends FormField<ExpenseCategoryType> {
  CategoryPickerFormField({
    Key? key,
    FormFieldSetter<ExpenseCategoryType>? onSaved,
    FormFieldValidator<ExpenseCategoryType>? validator,
    ExpenseCategoryType? initialValue,
    AutovalidateMode? autovalidateMode,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (state) {
              return _CategoryPicker(
                formFieldState: state,
              );
            });
}

class _CategoryPicker extends StatefulWidget {
  final FormFieldState<ExpenseCategoryType> formFieldState;

  const _CategoryPicker({Key? key, required this.formFieldState})
      : super(key: key);

  @override
  State<_CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<_CategoryPicker> {
  int selectedIndex = 0;

  void showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        builder: (_) => SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedIndex),
                          itemExtent: 50,
                          onSelectedItemChanged: (selectedIndex) {
                            setState(() {
                              this.selectedIndex = selectedIndex;
                            });
                            widget.formFieldState.didChange(
                                transformToExpanseCategoryType(selectedIndex));
                          },
                          children: expenseCategories
                              .map((c) => Center(
                                    child: Text(c),
                                  ))
                              .toList()),
                    ),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Done'))
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCategoryPicker(
          context,
        );
      },
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xfff4f0fa),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.formFieldState.value == null
                      ? const Text('Pick category')
                      : Text(transformFromExpenseCategoryTypeToString(
                          widget.formFieldState.value!)),
                  const Icon(
                    Icons.expand_circle_down,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          widget.formFieldState.hasError
              ? Text(widget.formFieldState.errorText!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error))
              : const SizedBox()
        ],
      ),
    );
  }
}
