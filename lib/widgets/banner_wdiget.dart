import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance; //igual que el login
  List _BannerList = []; // almacenar todos los banners
  // metodo para obtener banners
  getBanner() {
    return _firebaseFirestore
        .collection('banners')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _BannerList.add(doc['Image']);
        });
      });
    });
  } // querySnapshot para traer todos los registros

  @override
  void initState() {
    super.initState();
    getBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 120,
          width: double.infinity,
          child: PageView.builder(
              itemCount: _BannerList.length,
              itemBuilder: (context, index) {
                //  return Image.network(_BannerList[index]);
                return CachedNetworkImage(
                  imageUrl: _BannerList[index],
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(Colors.blue, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer(
                    // This is the ONLY required parameter
                    child: Container(
                      color: Colors.grey,
                    ),
                    // This is the default value
                    duration: Duration(seconds: 3),
                    // This is NOT the default value. Default value: Duration(seconds: 0)
                    interval: Duration(seconds: 5),
                    // This is the default value
                    color: Colors.white,
                    // This is the default value
                    colorOpacity: 0.3,
                    // This is the default value
                    enabled: true,
                    // This is the default value
                    direction: ShimmerDirection.fromLTRB(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              }),
        ),
      ),
    );
  }
}
