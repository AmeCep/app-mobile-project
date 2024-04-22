import 'package:desarrollo_movil_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingTabScreen extends StatefulWidget {
  const ShippingTabScreen({super.key});

  @override
  State<ShippingTabScreen> createState() => _ShippingTabScreenState();
}

class _ShippingTabScreenState extends State<ShippingTabScreen> {
  bool shippingCharge = false;
  int charge = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CheckboxListTile(
            title: Text(
              'Charge Shipping?',
              style: GoogleFonts.getFont(Constants().globalFont,
                  fontWeight: FontWeight.bold),
            ),
            value: shippingCharge,
            onChanged: (value) {
              setState(() {
                shippingCharge = value!;
              });
            },
          ),
          if(shippingCharge)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  charge = int.parse(value);
                });
              },
              decoration: InputDecoration(
                  labelText: 'Shipping Charge',
                  filled: true, 
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Field';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
