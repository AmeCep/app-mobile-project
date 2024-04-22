import 'package:desarrollo_movil_app/widgets/banner_wdiget.dart';
import 'package:desarrollo_movil_app/widgets/category_item.dart';
import 'package:desarrollo_movil_app/widgets/header_screen.dart';
import 'package:desarrollo_movil_app/widgets/products_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const HeaderScreen(),
        const BannerWidget(),
        const CategoryItem(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recommended for you'),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
        
        ProductsItem()
      ],
    ));
  }
}
