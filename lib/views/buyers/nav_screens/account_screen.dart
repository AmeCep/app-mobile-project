import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desarrollo_movil_app/constants.dart';
import 'package:desarrollo_movil_app/views/buyers/autorization/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('buyers');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(_auth.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Column(
            children: [
              const Text("Document does not exist"),
              TextButton(
                  onPressed: () {
                    _auth.signOut();
                  },
                  child: const Text('Signout'))
            ],
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              actions: const [
                Icon(
                  CupertinoIcons.moon,
                  color: Colors.white,
                )
              ],
              title: Text(
                'Profile',
                style: GoogleFonts.getFont(
                  Constants().globalFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data['fullName'],
                    style: GoogleFonts.getFont(Constants().globalFont,
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  data['email'],
                  style: GoogleFonts.getFont(Constants().globalFont,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black54),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                  ),
                  title: Text('Settings'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.phone,
                  ),
                  title: Text('Phone'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.shopping_cart_checkout,
                  ),
                  title: Text('Cart'),
                ),
                InkWell(
                  onTap: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                    ),
                    title: Text('Logout'),
                  ),
                ),
              ]),
            ),
          );
        }

        return const Text("loading");
      },
    );
  }
}
