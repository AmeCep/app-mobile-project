import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
   LogoutScreen({super.key});

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("LOGOUT"),
            TextButton(
                onPressed: () {
                  _auth.signOut();
                },
                child: const Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
