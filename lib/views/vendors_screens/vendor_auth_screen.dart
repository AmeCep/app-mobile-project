import 'package:desarrollo_movil_app/views/vendors_screens/landing_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider; 

class vendorAuthScreen extends StatelessWidget {
  const vendorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // si no hay un usuario logeado
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
            );
          }
          // return VendorRegistrationScreen();
          return const LandingScreen();

          /*    return ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text('sign out'),); */
        });
  }
}