import 'dart:convert';

class CategoryModel {
    final String categoryName;
    final String categoryImage;

    CategoryModel({
        required this.categoryName,
        required this.categoryImage,
    });

    // CategoryModel copyWith({
    //     String? categoryName,
    //     String? categoryImage,
    // }) => 
    //     CategoryModel(
    //         categoryName: categoryName ?? this.categoryName,
    //         categoryImage: categoryImage ?? this.categoryImage,
    //     );

    // factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    // factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    //     categoryName: json["categoryName"],
    //     categoryImage: json["categoryImage"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "categoryName": categoryName,
    //     "categoryImage": categoryImage,
    // };
}
