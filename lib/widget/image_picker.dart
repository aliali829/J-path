import 'package:flutter/material.dart';
import 'package:untitled75/theme/j-path-colors.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
        backgroundColor: JPathColors.bGroundAvtar,
        backgroundImage: const AssetImage("assets/images/avatar.png"),
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: JPathColors.containerAvtar,
                    border:
                        Border.all(color: JPathColors.borderAvtar, width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: JPathColors.iconAvtar,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
