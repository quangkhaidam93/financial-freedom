import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final String note;
  final String amount;
  final String time;

  const TransactionWidget(
      {Key? key, required this.note, required this.amount, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(note),
              Text(
                time,
                style: const TextStyle(color: Color(0xffb6b6cc)),
              )
            ]),
            flex: 2,
          ),
          Expanded(
            child: Text(
              '+$amount VNĐ',
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.green),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }
}
