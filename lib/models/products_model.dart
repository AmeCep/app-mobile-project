import 'package:meta/meta.dart';
import 'dart:convert';

class Products {
    final String productId;
    final String productName;
    final List<String> productSize;
    final int productPrize;
    final String description;
    final int discount;
    final String category;
    final int quantity;
    final List<String> productImages;

    Products({
        required this.productId,
        required this.productName,
        required this.productSize,
        required this.productPrize,
        required this.description,
        required this.discount,
        required this.category,
        required this.quantity,
        required this.productImages,
    });

    Products copyWith({
        String? productId,
        String? productName,
        List<String>? productSize,
        int? productPrize,
        String? description,
        int? discount,
        String? category,
        int? quantity,
        List<String>? productImages,
    }) => 
        Products(
            productId: productId ?? this.productId,
            productName: productName ?? this.productName,
            productSize: productSize ?? this.productSize,
            productPrize: productPrize ?? this.productPrize,
            description: description ?? this.description,
            discount: discount ?? this.discount,
            category: category ?? this.category,
            quantity: quantity ?? this.quantity,
            productImages: productImages ?? this.productImages,
        );

    factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        productId: json["productId"],
        productName: json["productName"],
        productSize: List<String>.from(json["productSize"].map((x) => x)),
        productPrize: json["productPrize"],
        description: json["description"],
        discount: json["discount"],
        category: json["category"],
        quantity: json["quantity"],
        productImages: List<String>.from(json["productImages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productSize": List<dynamic>.from(productSize.map((x) => x)),
        "productPrize": productPrize,
        "description": description,
        "discount": discount,
        "category": category,
        "quantity": quantity,
        "productImages": List<dynamic>.from(productImages.map((x) => x)),
    };
}
