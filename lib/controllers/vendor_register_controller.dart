import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class vendorController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  pickStoreImage(ImageSource gallery) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: gallery);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No image selected');
    }
  }

  _uploadVendorImageToStorage(Uint8List image) async {
    try {
      String userId =
          _firebaseAuth.currentUser?.uid ?? Uuid().v4(); // Usar un UUID
      Reference ref =
          _firebaseStorage.ref().child('profileImage').child(userId);
      UploadTask uploadTask = ref.putData(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> registerVendor(
      String businessName,
      String emailAddress,
      String phoneNumber,
      String countryValue,
      String stateValue,
      String cityValue,
      String taxTypeSelection,
      String rncNumber,
      Uint8List? image) async {
    String res = 'An error has occurred';
   try {
      String uploadedImage = await _uploadVendorImageToStorage(image!);
      print(uploadedImage);

      String userId = _firebaseAuth.currentUser?.uid ??
          Uuid().v4(); // Usar un UUID si el usuario no está autenticado
      await _firebaseFirestore.collection('vendors').doc(userId).set({
        "vendorId": userId,
        'businessName': businessName,
        'phoneNumber': phoneNumber,
        'countryValue': countryValue,
        'stateValue': stateValue,
        'cityValue': cityValue,
        'taxTypeSelection': taxTypeSelection,
        'rncNumber': rncNumber,
        'image': uploadedImage,
        'email': emailAddress,
        'approved': false // Corregí el nombre de la clave 'approved'
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
      EasyLoading.dismiss();
    }
    return res;
  }
}