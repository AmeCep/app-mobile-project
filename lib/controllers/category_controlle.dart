import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desarrollo_movil_app/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchCategories();
  }

  void _fetchCategories() {
    _firebaseFirestore
        .collection('categories')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      categories.assignAll(querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return CategoryModel(
            categoryName: data['categoryName'],
            categoryImage: data['categoryImage']);
      }).toList());
    });
  }
}
