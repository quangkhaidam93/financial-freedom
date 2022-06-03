import 'package:financial_freedom/screens/expense_form/expense_form.screen.dart';
import 'package:financial_freedom/screens/main/main.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: ExpenseFormScreen(),
    theme: ThemeData(
        textTheme: const TextTheme().copyWith(
            headline1: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            headline2: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            headline3: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        colorScheme: const ColorScheme(
          primary: Color(0xff6b49fb),
          primaryContainer: Color(0xff463284),
          onPrimary: Colors.white,
          secondary: Color(0xffc6e6ff),
          secondaryContainer: Color(0xff6ac3fb),
          onSecondary: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white,
        )),
  ));
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(context) {
//     // Instantiate your class using Get.put() to make it available for all "child" routes there.
//     final Controller c = Get.put(Controller());

//     return Scaffold(
//         // Use Obx(()=> to update Text() whenever count is changed.
//         appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

//         // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
//         body: Center(
//             child: ElevatedButton(
//                 child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
//         floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.add), onPressed: c.increment));
//   }
// }

// class Other extends StatelessWidget {
//   // You can ask Get to find a Controller that is being used by another page and redirect you to it.
//   final Controller c = Get.find();

//   @override
//   Widget build(context) {
//     // Access the updated count variable
//     return Scaffold(
//         appBar: AppBar(title: Text('Hello')),
//         body: Center(child: Text("${c.count}")));
//   }
// }
