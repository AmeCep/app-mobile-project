import 'package:desarrollo_movil_app/constants.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Your Cart is Empty',
            style: GoogleFonts.getFont(Constants().globalFont,
                fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const MainScreen();
                },
              ));
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xff9ca8ff),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Continue Shopping',
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
      ],
    );
  }
}
