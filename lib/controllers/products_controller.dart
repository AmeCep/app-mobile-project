import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desarrollo_movil_app/models/products_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  RxList<Products> products = <Products>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }

 

   void getProducts() async {
    final CollectionReference tipoUsuarioCollection =
      FirebaseFirestore.instance.collection("products");
    QuerySnapshot querySnapshot = await tipoUsuarioCollection.get();

    
    products.value =  querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Products.fromJson(data);
    }).toList();
  }
}
