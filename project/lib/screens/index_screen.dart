import 'package:flutter/material.dart';

import '../constants.dart';
import 'bottomnavigation/homepage_view.dart';
import 'bottomnavigation/profile_view.dart';
import 'bottomnavigation/reportspage_view.dart';
import 'bottomnavigation/stockandinventorypage_view.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);
  static const routeName = "/homePage";

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const StockandInventoryPage(),
    const ReportsPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shelves),
            label: 'Stock and Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        backgroundColor: ColorPalette.underlineTextField,
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
      ),
    );
  }
}
