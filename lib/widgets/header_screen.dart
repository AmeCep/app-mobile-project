import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // para apilar widgets
      children: [
        Image.asset('assets/icons/searchBanner.jpeg',
            width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
        Positioned(
          left: 48,
          top: 64,
          child: SizedBox(
            width: 250,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.95),
                  hintText: 'enter here',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Image.asset('assets/icons/search.png'),
                  suffixIcon: Image.asset('assets/icons/cam.png'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          ),
        ),
        Positioned(
          left: 311,
          top: 75,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {},
              overlayColor:
                  MaterialStatePropertyAll(const Color(0xFF0C7F7F).withOpacity(0.7)),
              child: Ink(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/icons/bell.png'),
                )),
              ),
            ),
          ),
        ),
        Positioned(
          left: 354,
          top: 75,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {},
              overlayColor:
                  MaterialStatePropertyAll(const Color(0xFF0C7F7F).withOpacity(0.7)),
              child: Ink(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/icons/message.png'),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
