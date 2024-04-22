import 'package:desarrollo_movil_app/controllers/category_controlle.dart';
import 'package:desarrollo_movil_app/controllers/products_controller.dart';
import 'package:desarrollo_movil_app/firebase_options.dart';
import 'package:desarrollo_movil_app/provider/product_provider.dart';
import 'package:desarrollo_movil_app/views/buyers/autorization/login_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/main_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/main_vendor_screen.dart';
import 'package:desarrollo_movil_app/views/vendors_screens/vendor_auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return ProductProvider();
        },
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainScreen() ,
      // home: MainVendorScreen(),
      // home: const vendorAuthScreen(), //login de vendedores/ameliamobileintec@gmail.com/123456
      home:  LoginScreen(), //login compradores /ameliacompradora@gmail.com/123456
      initialBinding: BindingsBuilder(() {
        Get.put<CategoryController>(CategoryController());
        Get.put<ProductsController>(ProductsController());
      }),
    );
  }
}
