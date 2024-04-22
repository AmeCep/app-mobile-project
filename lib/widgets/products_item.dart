import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desarrollo_movil_app/constants.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/inner_screens/product_detail_sreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/products_model.dart';

class ProductsItem extends StatelessWidget {
  ProductsItem({super.key});
  final Stream<QuerySnapshot> _categoriesStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Flexible(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              // Convierte el QueryDocumentSnapshot a un Map<String, dynamic>
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              // Mapea el mapa a un objeto Products
              Products product = Products.fromJson(data);
              return InkWell(
                onTap: () {
                  Get.to(() => ProductDetailsScreen(product: product));
                },
                child: Container(
                  width: 250.0, // Adjust card width as needed
                  height: 400,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content left
                    children: [
                      Stack(
                        // Stack image and rating (optional)
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Match card corner radius
                              border: Border.all(
                                color: Colors.grey[
                                    400]!, // Adjust border color as needed
                                width: 1.0, // Adjust border width as needed
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Match container corner radius
                              child: Image.network(
                                product.productImages[0],
                                height: 200.0, // Adjust image height as needed
                                width: 200, // Expand image to full width
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child:
                                        const Center(child: Icon(Icons.error)),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Add a rating widget here if desired (consider using a rating package)
                        ],
                      ),
                      const SizedBox(
                          height: 8.0), // Add spacing between image and text

                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            '4.5',
                            style: GoogleFonts.getFont(Constants().globalFont,
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        ],
                      ), // Add spacing between image and text
                      Text(
                        product.productName,
                        style: GoogleFonts.getFont(Constants().globalFont,
                            fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 1, // Limit product name to one line
                        overflow: TextOverflow
                            .ellipsis, // Add ellipsis for long names
                      ),
                      const SizedBox(
                          height: 4.0), // Add spacing between elements
                      Text(
                        product.description, // Truncate description
                        maxLines: 2, // Allow wrapping for longer descriptions
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.getFont(Constants().globalFont,
                            fontWeight: FontWeight.normal,
                            fontSize: 16), // Add ellipsis for truncated text
                      ),
                      const SizedBox(
                          height: 1.0), // Add spacing between elements
                      Text(
                        product.category,
                        style: GoogleFonts.getFont(
                          Constants().globalFont,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Align price and category
                        children: [
                          Text(
                            '\$${product.productPrize.toStringAsFixed(2)}', // Format price with 2 decimal places
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.red),
                          ),
                          Text(
                            product.quantity.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
