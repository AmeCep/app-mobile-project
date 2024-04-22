import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desarrollo_movil_app/models/vendor_model.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/main_vendor_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendor_registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:flutter/material.dart'; 

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference vendorsStream =
        FirebaseFirestore.instance.collection('vendors');
    FirebaseAuth _auth = FirebaseAuth.instance;
    return StreamBuilder<DocumentSnapshot>(
        stream: vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          //REVISAMOS SI EL VENDEDOR COMPLETO EL REGISTRO
          if (!snapshot.data!.exists) {
            return const VendorRegistrationScreen();
          }
          VendorModel vendorModel = VendorModel.fromJson(
              snapshot.data!.data() as Map<String, dynamic>);
          if (vendorModel.approved) {
            return MainVendorScreen();
          }
          //Si llega a este punto es poque no ha llegado

          return Scaffold(
            body: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(vendorModel.image,
                        width: 90, fit: BoxFit.cover)),
                const SizedBox(height: 15),
                Text(
                  vendorModel.businessName.toUpperCase(),
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text('Your Profile was sent for Approval')
              ]),
            ),
          );
        });
  }
}
