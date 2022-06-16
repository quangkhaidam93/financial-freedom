// ignore_for_file: constant_identifier_names

import 'package:financial_freedom/models/expense_category.model.dart';
import 'package:financial_freedom/utils/money_formatter.dart';
import 'package:financial_freedom/utils/number_transformer.dart';
import 'package:flutter/material.dart';

const double THRESHOLD_FOR_DISPLAY_PERCENTAGE_BLOCK = 0.4;
const double THRESHOLD_FOR_DISPLAY_PERCENTAGE_TEXT = 0.2;
const double HEIGHT_FACTOR = 1;

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width - 80,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: category.lightColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://www.pngmart.com/files/11/Shopping-PNG-Background-Image.png'),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      NumberTransformer.transformPercentage(category.ratio!),
                      style: TextStyle(
                          color: category.darkColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff4f0fa),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      FractionallySizedBox(
                        heightFactor: HEIGHT_FACTOR,
                        widthFactor: category.ratio,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                category.lightColor,
                                category.darkColor
                              ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (category.ratio! >=
                                  THRESHOLD_FOR_DISPLAY_PERCENTAGE_TEXT)
                                Text(NumberTransformer.transformPercentage(
                                    category.ratio!)),
                              if (category.ratio! >=
                                  THRESHOLD_FOR_DISPLAY_PERCENTAGE_BLOCK)
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: const Icon(Icons.view_week, size: 16),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          children: [
                            TextSpan(
                                text:
                                    'Spent ${MoneyFormatter.transformMoneyToVNCurrency(category.spent.toStringAsFixed(0))}VNĐ in '),
                            TextSpan(
                                text:
                                    '${MoneyFormatter.transformMoneyToVNCurrency(category.total.toStringAsFixed(0))}VNĐ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary))
                          ]),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
