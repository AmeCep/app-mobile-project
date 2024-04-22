import 'package:desarrollo_movil_app/controllers/category_controlle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final CategoryController _categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _categoryController.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 4, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(children: [
                  Image.network(
                      _categoryController.categories[index].categoryImage,
                      height: 47,
                      width: 47,
                      fit: BoxFit.cover),
                  Text(_categoryController.categories[index].categoryName)
                ]),
              );
            },
          )
        ],
      );
    });
  }
}
