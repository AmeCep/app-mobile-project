import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/earnings_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/edit_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/logout_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/order_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/tabs_screens/general_tab_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
class MainVendorScreen extends StatefulWidget {
  MainVendorScreen({Key? key}) : super(key: key);

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentPage = 0;
  final List<Widget> _pages = [
    const EarningsScreen(),
    const UploadScreen(),
    const EditScreen(),
    const OrderScreen(), 
    LogoutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.up_arrow),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Orders',
          ),
           
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'LogOut',
          ),
        ],
      ),
      body: _pages[_currentPage],
    );
  }
}
