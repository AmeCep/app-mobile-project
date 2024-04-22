import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/tabs_screens/attributes_tab_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/tabs_screens/general_tab_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/tabs_screens/images_tab_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendors_screen/tabs_screens/shipping_tab_screen.dart';
import 'package:flutter/material.dart'; 
class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Upload",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text('General'),
            ),
            Tab(
              child: Text('Shipping'),
            ),
            Tab(
              child: Text('Attributes'),
            ),
            Tab(
              child: Text('Images'),
            ),
          ]),
        ),
        body:   TabBarView(
          children: [
            const GeneralTabScreen(),
            const ShippingTabScreen(),
            const AttributesTabScreen(),
            ImagesTabScreen()
          ],
        ),
      ),
    );
  }
}