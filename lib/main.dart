import 'package:financial_freedom/firebase_options.dart';
import 'package:financial_freedom/screens/expense_form/expense_form.screen.dart';
import 'package:financial_freedom/screens/main/main.screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(GetMaterialApp(
    home: const MainScreen(),
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
    initialRoute: '/',
    getPages: [
      GetPage(name: MainScreen.routeName, page: () => const MainScreen()),
      GetPage(
        name: ExpenseFormScreen.routeName,
        page: () => ExpenseFormScreen(),
      )
    ],
  ));
}
