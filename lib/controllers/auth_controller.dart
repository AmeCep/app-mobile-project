import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // Registers users
  Future<String> registerUser(
      String email, String name, String password) async {
    String response = 'Something went wrong';
    try {
      // register firebase
      UserCredential _userCredential = await _fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // save the user in database
      await _firebaseFirestore
          .collection('buyers')
          .doc(_userCredential.user!.uid)
          .set({
        'fullName': name,
        'profileImage': "",
        'email': email,
        'uid': _userCredential.user!.uid,
        'pinCode': "",
        'locally': "",
        'city': "",
        'state': "",
      });

      response = "success";
    } catch (error) {
      response = error.toString();
    }
    return response;
  }

  // Login users
  Future<String> loginUser(String email, String password) async {
    String response = "Something went worng";
    try {
      UserCredential _userCredential = await _fireBaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      response = 'success';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        response = 'user-not-found';
      } else if (error.code == 'wrong-password') {
        response = "Wrong password";
      }
    } catch (error) {
      response = error.toString();
    }
    return response;
  }
}