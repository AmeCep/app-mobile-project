import 'package:desarrollo_movil_app/constants.dart';
import 'package:desarrollo_movil_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.red,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  product.productImages[0],
                  height: 200.0, // Adjust image height as needed
                  width: 200, // Expand image to full width
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(child: Icon(Icons.error)),
                    );
                  },
                ),
                Row(
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9ca8ff),
                      ),
                    ),
                    const Expanded(child: Text("")),
                    Text(
                      '\$${product.productPrize.toStringAsFixed(2)}', // Format price with 2 decimal places
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9ca8ff),
                      ),
                    ),
                    Text(
                      product.quantity.toStringAsFixed(2),
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size:',
                      style: GoogleFonts.getFont(Constants().globalFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff9ca8ff),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(product.productSize[index],
                                          style: GoogleFonts.getFont(
                                              Constants().globalFont,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))),
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: product.productSize.length,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Descripción:',
                          style: GoogleFonts.getFont(Constants().globalFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    Text(
                      product.description,
                      style: GoogleFonts.getFont(
                        Constants().globalFont,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xff9ca8ff),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'ADD TO CART',
                style: GoogleFonts.getFont(
                  Constants().globalFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
