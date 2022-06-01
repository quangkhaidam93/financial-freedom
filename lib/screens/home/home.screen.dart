import 'package:financial_freedom/screens/home/widgets/body.widget.dart';
import 'package:financial_freedom/screens/home/widgets/header.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: const [HomeHeader(), HomeBody()],
        ),
      ),
    );
  }
}
