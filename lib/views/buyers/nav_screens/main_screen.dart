import 'package:desarrollo_movil_app/views/buyers/nav_screens/account_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/cart_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/category_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/home_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/search_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/store_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indexCurrentPage = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const StoreScreen(), 
    const CartScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_indexCurrentPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _indexCurrentPage,
          onTap: (value) {
            setState(() {
              _indexCurrentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag), label: 'Store'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: 'Cart'), 
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'Account')
          ]),
    );
  }
}
