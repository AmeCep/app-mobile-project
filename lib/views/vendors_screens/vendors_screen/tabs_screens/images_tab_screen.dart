import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desarrollo_movil_app/provider/product_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ImagesTabScreen extends StatefulWidget {
  ImagesTabScreen({super.key});

  @override
  State<ImagesTabScreen> createState() => _ImagesTabScreenState();
}

class _ImagesTabScreenState extends State<ImagesTabScreen> {
  final List<Uint8List?> _images = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<String> __imagesUrls = [];
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  _pickImage() async {
    final picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        for (var image in images) {
          image.readAsBytes().then((bytes) {
            _images.add(Uint8List.fromList(bytes));
            setState(
                () {}); // Notificar a Flutter que se han agregado nuevas imágenes
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    _uploadProductsImagesToStorage() async {
      EasyLoading.show(status: 'Please Wait');
      for (var image in _images) {
        Reference ref = _firebaseStorage
            .ref()
            .child('productImages')
            .child(const Uuid().v4());
        await ref.putData(image!).whenComplete(() async {
          await ref.getDownloadURL().then((value) {
            setState(() {
              __imagesUrls.add(value);
            });

            print(value);
            EasyLoading.dismiss();

            _productProvider.getFormData(imageUrlList: __imagesUrls);
          });
        });
      }
    }

    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: _images.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return index == 0
                  ? Center(
                      child: IconButton(
                        onPressed: () {
                          _pickImage();
                        },
                        icon: const Icon(Icons.add),
                      ),
                    )
                  : Image.memory(_images[index - 1]!);
            },
          ),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                _uploadProductsImagesToStorage();
              },
              child: Text('UPLOAD'))
        ],
      ),
    );
  }
}
