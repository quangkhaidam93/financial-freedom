import 'package:financial_freedom/screens/home/home.screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bodyBuilder() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
      case 2:
      case 3:
        return const Center(child: Text('Other Page'));
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyBuilder(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: const Color(0xffb6b6cc),
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
