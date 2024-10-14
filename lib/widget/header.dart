import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled75/theme/j-path-colors.dart';
import 'package:untitled75/widget/logo.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return kIsWeb
        ? Row(children: [
            const Logo(),
            const SizedBox(width: 6),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSerif'),
              ),
            ),
          ])
        : Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.3,
                //height: size. double.infinity,
                child: Image.asset('assets/images/friendship.png'),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: JPathColors.text2,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSerif'),
                ),
              ),
            ],
          );
  }
}
